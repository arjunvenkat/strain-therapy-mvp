class CreateUserAilments < ActiveRecord::Migration
  def change
    create_table :user_ailments do |t|
      t.integer :user_id
      t.integer :ailment_id

      t.timestamps null: false
    end
  end
end
