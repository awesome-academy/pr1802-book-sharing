class AddAverageRatingToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :average_rating, :integer
  end
end
