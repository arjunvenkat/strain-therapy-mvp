class AddPreferredMethodAndZodiacToUser < ActiveRecord::Migration
  def change
    add_column :users, :preferred_method, :string
    add_column :users, :zodiac_sign, :string
  end
end
