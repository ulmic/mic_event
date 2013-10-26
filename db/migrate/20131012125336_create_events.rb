class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :title
      t.text :description
      t.integer :member_id
      t.integer :place_id
      t.datetime :event_time

      t.timestamps
    end
  end
end
