class AddPicturesToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :pictures, :string
  end
end
