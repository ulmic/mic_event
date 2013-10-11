class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.text :title
      t.text :description

      t.timestamps
    end
  end
end
