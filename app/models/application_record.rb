class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.events_dates(events)
        
    upcoming_events =[]
    previous_events =[]

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
