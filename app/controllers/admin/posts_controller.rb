class Admin::PostsController < Admin::AdminController
  def new
  end

  def create
    @post = Post.new(photo_params)
    if @post.save
      redirect_to explorations_path
    else
      render 'new'
    end
  end

  private
  def photo_params
    params.require(:post).permit(:description, {images: []})
  end
end
