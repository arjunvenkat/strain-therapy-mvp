class CreateScientificEvidences < ActiveRecord::Migration
  def change
    create_table :scientific_evidences do |t|
      t.integer :ailment_id
      t.text :description
      t.string :link
      t.boolean :featured
      t.text :comment

      t.timestamps null: false
    end
  end
end
