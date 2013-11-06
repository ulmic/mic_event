class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :title
      t.text :description
      t.integer :member_id
      t.integer :place_id
      t.datetime :begin_datetime
      t.datetime :end_datetime
      t.integer :program_id

      t.timestamps
    end
  end
end
