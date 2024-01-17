class PostersController < Admin::AdminController
  def new
  end

  def create
    @poster = Poster.new(poster_params)
    if @poster.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @poster = Poster.find(params[:id])
    puts @poster.image
  end

  def update
    @poster = Poster.find(params[:id])
    if @poster.update(poster_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private
  def poster_params
    params.require(:poster).permit(:name, :image)
  end

end
