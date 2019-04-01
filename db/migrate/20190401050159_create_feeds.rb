class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds do |t|
      t.text :category
      t.text :media
      t.text :title
      t.text :description
      t.datetime :pub_date
      t.text :guid
      t.text :link

      t.timestamps
    end
  end
end
