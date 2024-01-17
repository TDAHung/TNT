class Genre::YanController < Genre::GenreController
  def index
    @yans = Yan.all
  end

  def show
    @yan = Yan.find(params[:id])
  end
end
