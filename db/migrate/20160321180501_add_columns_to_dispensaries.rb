class AddColumnsToDispensaries < ActiveRecord::Migration
  def change
    add_column :dispensaries, :llc_name, :string
    add_column :dispensaries, :code, :string
    add_column :dispensaries, :address, :string
    add_column :dispensaries, :city, :string
    add_column :dispensaries, :zip, :string
  end
end
