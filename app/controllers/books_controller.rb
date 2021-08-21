class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(book_params)
    else
      render :book
    end
  end

  def index
    @book = Book.new
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user)
  end
  def user_params
    params.require(:user).permit(:profile_image, :name)
  end

end
