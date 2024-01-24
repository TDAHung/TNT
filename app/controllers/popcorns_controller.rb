class PopcornsController < ApplicationController

  def create
    popcorn = Popcorn.new(popcorn_params)
    @popcorns = Popcorn.where(popcornable_type: popcorn.popcornable_type)
    case popcorn.popcornable_type
    when "Post"
      @genre = Post.find(popcorn.popcornable_id).includes(:popcorns)
    when "Yan"
      @genre = Yan.find(popcorn.popcornable_id).includes(:popcorns)
    when "Youth"
      @genre = Youth.find(popcorn.popcornable_id).includes(:popcorns)
    when "Angel"
      @genre = Angel.find(popcorn.popcornable_id).includes(:popcorns)
    end
    if popcorn.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("#{popcorn.popcornable_id}-#{popcorn.popcornable_type}",
              partial: 'shared/button/popcorn',
              locals: { genre: @genre, popcorns: @popcorns }),
          ]
        end
      end
    end
  end

  def destroy
    popcorn = Popcorn.find(params["id"])
    @popcorns = Popcorn.where(popcornable_type: popcorn.popcornable_type)
    case popcorn.popcornable_type
    when "Post"
      @genre = Post.find(popcorn.popcornable_id).includes(:popcorns)
    when "Yan"
      @genre = Yan.find(popcorn.popcornable_id).includes(:popcorns)
    when "Youth"
      @genre = Youth.find(popcorn.popcornable_id).includes(:popcorns)
    when "Angel"
      @genre = Angel.find(popcorn.popcornable_id).includes(:popcorns)
    end
    if popcorn.delete_all
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("#{popcorn.popcornable_id}-#{popcorn.popcornable_type}",
              partial: 'shared/button/popcorn',
              locals: { genre: @genre, popcorns: @popcorns }),
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
