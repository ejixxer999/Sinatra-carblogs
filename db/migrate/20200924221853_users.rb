class Users < ActiveRecord::Migration
  def change
    create_table :authors do |a|
      a.string :name 
      a.integer :age
      a.string :blog_title
    end 
  end
end
