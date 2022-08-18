class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :username
      t.text :password
      t.text :fullname
      t.timestamps
    end
  end
end
