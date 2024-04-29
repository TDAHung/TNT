class XiaoHanController < ApplicationController
  def index
    @xiao_hans = XiaoHan.all.order(updated_at: :desc).includes(:popcorns)
  end

  def show
    @xiao_han = XiaoHan.find(params[:id])
  end
end
