class AddImageNameToUsers < ActiveRecord::Migration[5.0]
  def change
    # Tambahkan kolom "image_name" pada tabel "users"
    add_column :users, :image_name, :string
  end
end
