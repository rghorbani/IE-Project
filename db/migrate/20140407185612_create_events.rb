class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :title
      t.datetime :event_time
      t.text :description
      t.boolean :need_to_send_mail

      t.timestamps
    end
  end
end
