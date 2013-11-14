class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.text :first_name
      t.text :middle_name
      t.text :last_name
      t.string :motto
      t.text :photo
      t.text :post
      t.integer :parent_id
      t.integer :user_id
      t.string :confirm
      t.timestamps
    end
  end
end
