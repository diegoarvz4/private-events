class User < ApplicationRecord

    has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
    has_many :attendances, foreign_key: :event_attendee_id
    has_many :events_attended, through: :attendances, source: :attended_event





end
