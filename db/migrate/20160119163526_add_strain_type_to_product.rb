class AddStrainTypeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :strain_type, :string
  end
end
