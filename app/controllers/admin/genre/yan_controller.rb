class Admin::Genre::YanController < Admin::AdminController
  def new
    @yan = Yan.new
  end

  def create
    @yan = Yan.new(yan_params)
    if @yan.save
      redirect_to genre_yan_path
    else
      render 'new'
    end
  end

  private
  def yan_params
    params.require(:yan).permit(:name, {pages: []})
  end
end
