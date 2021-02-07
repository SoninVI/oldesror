class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.text :description
      t.text :content
      t.boolean :active, default: true
      t.text :seo_key
      t.text :seo_title
      t.text :seo_desc
      t.text :seo_alt

      t.timestamps
    end
  end
end
