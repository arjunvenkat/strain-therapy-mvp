class AddDispensaryToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :dispensary, :string
  end
end
