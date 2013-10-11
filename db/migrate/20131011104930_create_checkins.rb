class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :member_id
      t.integer :place_id
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
