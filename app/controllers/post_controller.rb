class PostController < ActionController::Base
  def show
    puts params.to_yaml
    @item=Item.find_by_id(params[:id])
  end
end
