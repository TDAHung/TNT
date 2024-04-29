class XiaoXiaoController < ApplicationController
  def index
    @xiao_xiaos = XiaoXiao.all.order(updated_at: :desc).includes(:popcorns)
  end

  def show
    @xiao_xiao = XiaoXiao.find(params[:id])
  end
end
