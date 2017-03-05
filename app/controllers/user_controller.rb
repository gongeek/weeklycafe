require 'net/http'
require 'cgi'
require 'json'
class UserController < ApplicationController
  @@github_config={
      client_id: 'd58d42731bb20ace1cb0',
      redirect_api: '/login/github/callback',
      redirect_url: '',
      client_secret: '140c0484d8ac70c3a9d2803dfa35ed8bf9962c2f',
      state: '123123sadh1as12'
  }

  def login
    set_redirect_url
    session[:referrer] = params[:redirect_url]||request.referrer
    redirect_to "https://github.com/login/oauth/authorize?client_id=#{@@github_config[:client_id]}&redirect_uri=#{@@github_config[:redirect_url]}&state=#{@@github_config[:state]}"
  end

  def login_callback
    set_redirect_url
    if params[:state] != @@github_config[:state]
      not_found
    end
    user_info=get_user_info_by_code params[:code]
    if user_info
      user=User.find_by_origin_id(user_info['id'])
      unless user
        user=User.new_and_save(:origin_id => user_info['id'], :username => user_info['name'], :email => user_info['email'], :icon => user_info['avatar_url'])
      end
      session[:user_id]=user.id
      redirect_to session[:referrer]
    else
      not_found
    end
  end

  private
  def get_token_by_code code
    token_url = "https://github.com/login/oauth/access_token?client_id=#{@@github_config[:client_id]}&redirect_uri=#{@@github_config[:redirect_url]}&client_secret=#{@@github_config[:client_secret]}&code=#{code}&state=#{@@github_config[:state]}"
    url = URI.parse(token_url)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port, :use_ssl => url.scheme == 'https') { |http|
      http.request(req)
    }
    CGI::parse(res.body)["access_token"][0]
  end

  def get_user_info_by_code code
    token=get_token_by_code code
    user_api_url="https://api.github.com/user?access_token=#{token}"
    url = URI.parse(user_api_url)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port, :use_ssl => url.scheme == 'https') { |http|
      http.request(req)
    }
    JSON.parse res.body
  end

  def set_redirect_url
    if request.port==8779
      @@github_config[:redirect_url] = 'http://weeklycafe.com/login/github/callback'
      return
    end
    if request.port!=80
      @@github_config[:redirect_url] = "#{request.protocol}#{request.host}:#{request.port}#{@@github_config[:redirect_api]}"
    else
      @@github_config[:redirect_url] = "#{request.protocol}#{request.host}#{@@github_config[:redirect_api]}"
    end
  end

end