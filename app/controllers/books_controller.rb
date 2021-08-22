class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    # formで入力された値をbook_paramsで渡す。それをnewメソッドで新規作成
    @book.user_id = current_user.id
    # formでは@bookにuserのidは入力されていないのでcurrent_user.idでログインしているユーザーのidを渡す
    @book.save
    # formの情報およびユーザーid情報の入った@bookをsaveする。
    redirect_to book_path(@book.id)
    # redirect先に指定しているshowのページにはidの指定が必要。
    # @book.saveにて@bookを保存したことで投稿した@bookの情報にidが割り振られたので（saveしないとidは割り振られない）
    # @book.idとすることで投稿されたbookのshowページへ飛ばすことができる
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user_id
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
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
