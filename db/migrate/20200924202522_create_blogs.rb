class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |b|
      b.string :name
      b.string :author
    end 
  end
end
