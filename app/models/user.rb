class User < ApplicationRecord

    has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
    has_many :events_attended, through: :event_attendings, source: :attended_event
end
