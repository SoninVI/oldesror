class AddPositionToAboutHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :about_homes, :position, :integer
  end
end
