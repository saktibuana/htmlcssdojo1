class CreateContestants < ActiveRecord::Migration[7.0]
  def change
    create_table :contestants do |t|
      t.text :name
      t.text :age

      t.timestamps
    end
  end
end
