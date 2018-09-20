class AddStatusToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :status, :integer, default: 0
  end
  add_index :books, :status
end
