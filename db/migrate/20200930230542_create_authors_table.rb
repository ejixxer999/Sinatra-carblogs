class CreateAuthorsTable < ActiveRecord::Migration
  def change
    create_table :authors do |a|
      a.string :name
      a.string :email
      a.string :user_name
      a.string :password_digest

      a.timestamps null: false
    end 
  end
end
