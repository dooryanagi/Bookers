class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      # title（本のタイトル）とbody（感想）を作成
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
