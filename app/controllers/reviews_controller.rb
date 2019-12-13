class ReviewsController < ApplicationController 
  before_action :set_book

  def new 
    @review = Review.new   
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.book_id = @book.id

    if @review.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end


  private
  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating,:comment,:book_id)
  end


end
