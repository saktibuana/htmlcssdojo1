class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.text :name
      t.text :email
      t.text :password

      t.timestamps
    end
  end
end
