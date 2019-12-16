class CategoriesController < ApplicationController
  before_action :set_category, only: [:show,:edit,:update,:destroy,:books]
  before_action :authenticate_user!,except: [:index,:show,:books]
  def index
    @categories = Category.all.paginate(page: params[:page],per_page: 3)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html {redirect_to @category ,notice: "Category was successfully created"}
        format.json {render show,location: @category,status: :created}
      else
        format.html {render :new}
        format.json {render json: @category.errors,status: :unprocessable_entity}
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html{redirect_to @category, notice: "Category successfully updated"}
        format.json{render :show,status: :ok,location: @category}
      else
        format.html{render :edit}
        format.json{render json: @category.errors,status: :unprocessable_entity}
      end

    end
  end

  def destroy
     @category.destroy
     respond_to do |format| 
       format.html {redirect_to categories_path,notice: "Category successfully destroyed"}
       format.json {head :no_content}
     end
  end

  def books
     @books = @category.books
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name,:description)
  end



end
