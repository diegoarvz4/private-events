class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.integer :event_attendee_id, index: true
      t.integer :attended_event_id, index: true
      t.timestamps
    end
  end

  add_foreign_key :attendances, :users, column: :event_attendee_id
  add_foreign_key :attendances, :events, column: :attended_event_id
end
