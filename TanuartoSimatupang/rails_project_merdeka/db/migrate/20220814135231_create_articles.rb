class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :author
      t.boolean :status

      t.timestamps
    end
  end
end
