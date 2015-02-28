class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.references :admin, index: true

      t.timestamps null: false
    end
    add_index :posts, :slug, unique: true
    add_foreign_key :posts, :admins
  end
end
