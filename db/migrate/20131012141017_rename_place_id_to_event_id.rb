class RenamePlaceIdToEventId < ActiveRecord::Migration
  def up
    rename_column :checkins, :place_id, :event_id
  end
end
