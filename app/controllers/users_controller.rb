class UsersController < ApplicationController
  def show
    @user =User.find(params[:id])
    @books = @user.books
    # apli2-5 マイページのviewを記述する　より
    # .booksはおそらくbookテーブル内のそのユーザーに紐付けられた情報を参照している。
  end
end
