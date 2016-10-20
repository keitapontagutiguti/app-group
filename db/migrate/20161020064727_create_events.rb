class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :image
      t.string :tag
      t.string :area
      t.integer :day
      t.integer :capacity

      t.timestamps null: false
    end
  end
end
