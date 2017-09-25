class RemoveTagFromEvents < ActiveRecord::Migration
  def up
    remove_column :events, :tag
  end

  def down
  	add_column :events, :tag, :string
  end
end
