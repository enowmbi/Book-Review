class CategoriesController < ApplicationController
 before_action :set_category, only: [:show,:edit,:update,:destroy]
  def index
     @categories = Category.all
  end

  def show

  end

  def new
    @category = Category.new
  end

  private
  def set_category
     @category = Category.find(params[:id])
  end



end
