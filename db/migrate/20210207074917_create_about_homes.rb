class CreateAboutHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :about_homes do |t|
      t.string :text
      t.string :img
      t.attachment :img
      t.timestamps
    end
  end
end
