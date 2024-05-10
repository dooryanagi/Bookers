class BooksController < ApplicationController

  # 投稿内容の一覧を表示する
  def index
    @books = Book.all
  end

  # 投稿を保存するアクション
  def create
    # データを受け取り新規登録するためのインスタンス作成
    # 保存した後に新たに表示するviewはないため、ローカル変数を使用
    book = Book.new(book_params)
    # データベースに保存するためのsaveメソッド
    book.save
    # booksへリダイレクト
    redirect_to book_path(book.id)

  end

  #投稿フォームにあるページを表示する
  def new
    # viewファイルに値を渡すための印すランス変数を定義、【？】空のモデルオブジェクトを生成する
    @book = Book.new
  end

  # 編集機能
  def edit
    @book = Book.find(params[:id])
  end

  def update
    # 更新は新たなビューを作成しないため、ローカル変数を用いて行う
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end


  def show
    @book = Book.find(params[:id])
  end

  def destroy
    # 削除後は新たなビューを作成しないため、ローカル変数を用いて行う
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
