class WelcomeController < ApplicationController
  def index
    @items=Item.all
  end

end