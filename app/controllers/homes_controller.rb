class HomesController < ApplicationController
  before_action :check_user_authentication
  def index
    @poster = Poster.all.order(:id).limit(5)
  end
end
