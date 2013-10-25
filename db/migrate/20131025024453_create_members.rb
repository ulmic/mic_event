class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.text :first_name
      t.text :middle_name
      t.text :last_name
      t.integer :number
      t.string :email
      t.string :password
      t.string :motto
      t.text :photo
      t.text :post
      t.timestamps
    end
  end
end
