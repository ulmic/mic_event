class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.integer :member_id

      t.timestamps
    end
  end
end
