class Admin::XiaoHanController < ApplicationController
  def new
    @xiao_han = XiaoHan.new
  end

  def create
    @xiao_han = XiaoHan.new(xiao_han_params)
    if @xiao_han.save
      redirect_to xiao_han_index_path
    else
      render 'new'
    end
  end

  private
  def xiao_han_params
    params.require(:xiao_han).permit(:name, {pages: []})
  end
end
