class RemoveEventIdFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :event_id
  end

  def down
  	add_column :events, :event_id, :integer
  end
end
