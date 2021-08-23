class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    # apli2-5 マイページのviewを記述する　より
    # .booksはおそらくbookテーブル内のそのユーザーに紐付けられた情報を参照している。
  end

  def index
    @users = User.all
    @book_new = Book.new
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(user.id), notice: "You have updated user successfully"
    else
      @user = user
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


end
