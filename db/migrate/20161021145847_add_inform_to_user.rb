class AddInformToUser < ActiveRecord::Migration
  def change
    add_column :users, :inform, :text
  end
end
