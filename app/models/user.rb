class User < ApplicationRecord

    has_many :created_events, foreign_key: 'creator_id', class_name: 'Event'
    has_many :attendances, foreign_key: :event_attendee_id
    has_many :events_attended, through: :attendances, source: :attended_event


    def events_dates
        upcoming_events =[]
        previous_events =[]
        events = self.events_attended


        events.each do |event|

            if event.date > Time.now

                upcoming_events << event

            else  

                previous_events << event

            end 

        end 

        [upcoming_events, previous_events]

    end 

end
