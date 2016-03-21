class RemoveDescriptionFromDispensaries < ActiveRecord::Migration
  def change
    remove_column :dispensaries, :description, :text
  end
end
