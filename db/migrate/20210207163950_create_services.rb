class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :text
      t.string :img
      t.attachment :img
      t.integer :position
      t.string :ancestry
      t.string :slug
      t.timestamps
    end
    add_index :services, :ancestry
  end
end
