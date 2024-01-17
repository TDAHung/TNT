class Admin::Genre::YouthController < Admin::AdminController
  def new
    @youth = Youth.new
  end

  def create
    @youth = Youth.new(youth_params)
    if @youth.save
      redirect_to genre_youth_path
    else
      render 'new'
    end
  end

  private
  def youth_params
    params.require(:youth).permit(:name, {pages: []})
  end
end
