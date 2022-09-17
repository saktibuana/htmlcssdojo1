class CreateContests < ActiveRecord::Migration[7.0]
  def change
    create_table :contests do |t|
      t.string :name
      t.string :description
      t.integer :maxcontestant
      t.boolean :status

      t.timestamps
    end
  end
end
