class CreateSliders < ActiveRecord::Migration[5.2]
  def change
    create_table :sliders do |t|
      t.text :slogan
      t.string :img
      t.attachment :img
      t.timestamps
    end
  end
end
