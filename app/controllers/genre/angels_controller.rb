class Genre::AngelsController < Genre::GenreController
  def index
    @angels = Angel.all
  end

  def show
    @angel = Angel.find(params[:id])
  end
end
