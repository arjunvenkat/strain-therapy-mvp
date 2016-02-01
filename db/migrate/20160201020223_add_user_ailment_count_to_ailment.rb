class AddUserAilmentCountToAilment < ActiveRecord::Migration
  def change
    add_column :ailments, :user_ailment_count, :integer
  end
end
