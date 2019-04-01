class AddIndexToFeed < ActiveRecord::Migration[5.2]
  def change
    add_index :feeds, :guid, unique: true
  end
end
