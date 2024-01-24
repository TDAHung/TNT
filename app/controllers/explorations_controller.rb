class ExplorationsController < ApplicationController
  before_action :check_user_authentication
  def index
    @posts = Post.all.order(updated_at: :desc).includes(:popcorns)
    @popcorns = Popcorn.where(popcornable_type: "Post")
  end
end
