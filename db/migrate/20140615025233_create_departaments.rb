class CreateDepartaments < ActiveRecord::Migration
  def change
    create_table :departaments do |t|
      t.text :title
      t.text :description
      t.text :district
      t.integer :lider_id

      t.timestamps
    end
  end
end
