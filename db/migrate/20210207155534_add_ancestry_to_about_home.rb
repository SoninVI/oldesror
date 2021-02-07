class AddAncestryToAboutHome < ActiveRecord::Migration[5.2]
  def change
    add_column :about_homes, :ancestry, :string
    add_index :about_homes, :ancestry
  end
end
