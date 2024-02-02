class PopcornsController < ApplicationController

  def create
    popcorn = Popcorn.new(popcorn_params)
    popcorn.user_id = @current_user.id
    @popcorns = Popcorn.where(popcornable_type: popcorn.popcornable_type)
    case popcorn.popcornable_type
    when "Post"
      @genre = Post.find(popcorn.popcornable_id)
    when "Yan"
      @genre = Yan.find(popcorn.popcornable_id)
    when "Youth"
      @genre = Youth.find(popcorn.popcornable_id)
    when "Angel"
      @genre = Angel.find(popcorn.popcornable_id)
    end
    if popcorn.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream:
          [
            turbo_stream.replace("popcorn-#{popcorn.popcornable_id}-#{popcorn.popcornable_type}",
              partial: 'shared/button/popcorn',
              locals: { genre: @genre }),
          ]
        end
      end
    end
  end

  def destroy
    popcorn = Popcorn.find_by(user_id: params["id"],
      popcornable_id: popcorn_params[:popcornable_id],
      popcornable_type: popcorn_params[:popcornable_type])
    case popcorn.popcornable_type
    when "Post"
      @genre = Post.find(popcorn.popcornable_id)
    when "Yan"
      @genre = Yan.find(popcorn.popcornable_id)
    when "Youth"
      @genre = Youth.find(popcorn.popcornable_id)
    when "Angel"
      @genre = Angel.find(popcorn.popcornable_id)
    end
    if popcorn.destroy
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream:
          [
            turbo_stream.replace("popcorn-#{popcorn.popcornable_id}-#{popcorn.popcornable_type}",
              partial: 'shared/button/popcorn',
              locals: { genre: @genre }),
          ]
        end
      end
    end
  end

  private
  def popcorn_params
    params.require(:popcorn).permit(:popcornable_id, :popcornable_type)
  end
end
