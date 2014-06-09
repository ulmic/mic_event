class AddPhotoToEvent < ActiveRecord::Migration
  def change
    add_column :events, :photo, :text
  end
end
