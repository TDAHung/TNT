class Admin::Genre::AngelsController < Admin::AdminController

  def new
    @angel = Angel.new
  end

  def create
    @angel = Angel.new(angel_params)
    if @angel.save
      redirect_to genre_angels_path
    else
      render 'new'
    end
  end

  private
  def angel_params
    params.require(:angel).permit(:name, {pages: []})
  end
end
