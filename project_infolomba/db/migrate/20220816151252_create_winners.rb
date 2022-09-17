class CreateWinners < ActiveRecord::Migration[7.0]
  def change
    create_table :winners do |t|
      t.integer :contest_id
      t.integer :user_id

      t.timestamps
    end
  end
end
