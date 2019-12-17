class AddReviewsCountToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :reviews_count, :integer,null: false,default: 0
  end
end
