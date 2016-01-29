class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :ailment_id
      t.integer :product_id
      t.string :method
      t.integer :amount
      t.integer :effectiveness
      t.text :positives
      t.text :negatives
      t.text :additional_info

      t.timestamps null: false
    end
  end
end
