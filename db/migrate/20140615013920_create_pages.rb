class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :title
      t.text :slug
      t.text :body
      t.datetime :publish
      t.integer :author_id

      t.timestamps
    end
  end
end
