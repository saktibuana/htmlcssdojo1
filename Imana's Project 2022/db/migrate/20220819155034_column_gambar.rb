class ColumnGambar < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :gambar, :string
  end
end
