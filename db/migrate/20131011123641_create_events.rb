class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.integer :place_id
      t.datetime :datetime
      t.integer :member_id

      t.timestamps
    end
  end
end
