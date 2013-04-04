class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.belongs_to :category
      t.string :title
      t.text :content
      t.boolean :published

      t.timestamps
    end
    add_index :blogs, :category_id
  end
end
