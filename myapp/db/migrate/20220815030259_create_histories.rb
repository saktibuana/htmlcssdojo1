class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
    	t.string :title
    	t.text :desc
    	t.integer :post_by
     	t.timestamps
    end
  end
end
