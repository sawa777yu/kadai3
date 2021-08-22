class UsersController < ApplicationController
  def show
    @user =User.find(params[:id])
    @books = @user.books
    # apli2-5 マイページのviewを記述する　より
    # .booksはおそらくbookテーブル内のそのユーザーに紐付けられた情報を参照している。
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
