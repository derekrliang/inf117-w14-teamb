class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.datetime :created_at
      t.datetime :updated_at
      t.string :content

      t.timestamps
    end
  end
end
