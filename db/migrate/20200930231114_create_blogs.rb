class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :info
      t.integer :author_id
      t.timestamps null: false
    end
  end
end
