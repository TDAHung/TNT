class Genre::YouthController < Genre::GenreController
  def index
    @youths = Youth.all
  end

  def show
    @youth = Youth.find(params[:id])
  end
end
