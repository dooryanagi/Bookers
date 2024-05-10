Rails.application.routes.draw do
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # まとめてbooksコントローラーのルーティングを行う
  resources :books

  # booksを個別で設定する
  # get 'books' => 'books#index'
  # 個別の詳細ページへのルーティング
  # get 'books/:id' => 'books#show', as: 'book'

  # 【？】idが絡むときは名前付きルーティングをするといい感じになるのかな？
  # すでにresourcesで指定してくれている！これをするとエラーになる
  # get 'books/:id/edit' => 'books#edit', as: 'book_edit'

  # ルーティングはすでに完成しているが名前が付けられていない、この場合は新たに定義できる？？→できる！
  # すでにあるルーティングに名前だけ付ける
  patch 'books/:id' => 'books#update', as: 'update_book'



  end
