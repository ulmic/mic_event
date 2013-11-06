class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.text :name
      t.integer :lider_id
      t.text :description
      t.text :logo

      t.timestamps
    end
  end
end
