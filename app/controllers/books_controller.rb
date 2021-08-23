class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    # formで入力された値をbook_paramsで渡す。それをnewメソッドで新規作成
    @book.user_id = current_user.id
    # formでは@bookにuserのidは入力されていないのでcurrent_user.idでログインしているユーザーのidを渡す
    if @book.save
    # formの情報およびユーザーid情報の入った@bookをsaveする。
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    # redirect先に指定しているshowのページにはidの指定が必要。
    # @book.saveにて@bookを保存したことで投稿した@bookの情報にidが割り振られたので（saveしないとidは割り振られない）
    # @book.idとすることで投稿されたbookのshowページへ飛ばすことができる
    else
      @books = Book.all
      render :index
      # renderというのはアクションをすべて無視してviewを表示するわけではなく、記述している箇所のアクション（ここではcreate）は読み込む。
      # なのでrender先で読み込ませたいインスタンス変数などがある場合はrenderの上辺りに記述すると問題なく読み込まれる。
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
    @user_name = User.find(@user.id)
    # @bookにひもづいたuser_id(idが省略されている)。userは単数。リレーションの１対Ｎの関係性による
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
     redirect_to books_path
    end
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      redirect_to book_path(book), notice: "You have updated book successfully."
    else
      @book = book
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user)
  end
  
end
