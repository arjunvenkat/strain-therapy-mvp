class AddLinkToAilment < ActiveRecord::Migration
  def change
    add_column :ailments, :link, :string
  end
end
