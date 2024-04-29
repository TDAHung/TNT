class Admin::XiaoXiaoController < ApplicationController
  def new
    @xiao_xiao = XiaoXiao.new
  end

  def create
    @xiao_xiao = XiaoXiao.new(xiao_xiao_params)
    if @xiao_xiao.save
      redirect_to xiao_xiao_index_path
    else
      render 'new'
    end
  end

  private
  def xiao_xiao_params
    params.require(:xiao_xiao).permit(:name, {pages: []})
  end
end
