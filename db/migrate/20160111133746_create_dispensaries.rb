class CreateDispensaries < ActiveRecord::Migration
  def change
    create_table :dispensaries do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
