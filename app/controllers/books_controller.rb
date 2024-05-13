class BooksController < ApplicationController

  # 投稿内容の一覧を表示する
  def index
    @books = Book.all
    @book = Book.new
  end

  # 投稿を保存するアクション
  def create
    # データを受け取り新規登録するためのインスタンス作成
    # 保存した後に新たに表示するviewはないため、ローカル変数を使用
    # ここは結局インスタンス変数？
    @book = Book.new(book_params)
    @books = Book.all
    # データベースに保存するためのsaveメソッド
    # バリデーションの反映
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    # データがなければ一覧のまま
    else
      flash.now[:alert] = "Failed to create book."
      # ここはrender?redirect_to?
      render :index
    end

  end

  #投稿フォームにあるページを表示する
  def new
    # viewファイルに値を渡すためのインスタンス変数を定義、【？】空のモデルオブジェクトを生成する
    @book = Book.new
  end

  # 編集機能
  def edit
    @book = Book.find(params[:id])
  end

  #更新
  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      flash.now[:alert] = "Failed to update book."
      # 右はアクション名
      render :edit
    end

  end


  def show
    @book = Book.find(params[:id])
  end

  def destroy
    # 削除後は新たなビューを作成しないため、ローカル変数を用いて行う
    book = Book.find(params[:id])
    book.destroy
    # '/books'と:indexはどちらも行ける？
    # URL
    redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
