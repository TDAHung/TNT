class ExplorationsController < ApplicationController
  before_action :check_user_authentication
  def index
    @posts = Post.all.order(updated_at: :desc).includes(:popcorns)
  end
end
