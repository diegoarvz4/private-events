class Event < ApplicationRecord

   belongs_to :creator, class_name: 'User'
   has_many :attendances, foreign_key: :attended_event_id
   has_many :attendees, through: :attendances, source: :event_attendee

  scope :past_events, -> { where('date < ?', Time.now)}

  scope :upcoming_events, -> { where('date > ?', Time.now)}
end
