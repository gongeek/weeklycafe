class UserController < ApplicationController
  @@github_config={
      client_id: 'd58d42731bb20ace1cb0',
      redirect_api: '/login/github/callback',
      redirect_url: '',
      client_secret: '140c0484d8ac70c3a9d2803dfa35ed8bf9962c2f',
      state: '123123sadh1as12'
  }

  function _formatReferer(ctx) {
    let query = ctx.query
  }

  def login
    @@github_config[:redirect_url] = "#{request.protocol}://#{request.host}#{@@github_config.redirect_api}"
    session[:referrer] = request.referrer
    redirect_to "https://github.com/login/oauth/authorize?client_id=#{@@github_config.client_id}&redirect_uri=#{@@github_config.redirect_url}&state=#{@@github_config.state}"
  end

  def login_callback
    @@github_config[:redirect_url] = "#{request.protocol}://#{request.host}#{@@github_config.redirect_api}"
  end
end