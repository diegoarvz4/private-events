require 'rails_helper'

RSpec.describe Event, type: :model do
  it "is valid with description, date and creator" do
    #event = Event.new(description: "My description", date: Time.now, creator_id: 1) 
    user = User.create(name:"Daniel", password:" ")
    event = user.created_events.build(description: "My description", date: Time.now)
    expect(event).to be_valid
  end 

  it "is not valid without a creator" do
    event = Event.new(description: "My description", date: Time.now) 
    expect(event).to_not be_valid
  end 

  it "is not valid without description" do
    user = User.create(name:"Joseph", password:" ")
    event = user.created_events.build(description: " ", date: Time.now)
    expect(event).to_not be_valid
  end 

  it "is not valid without event" do
    user = User.create(name:"Joseph", password:" ")
    event = user.created_events.build(description: "Party", date: nil)
    expect(event).to_not be_valid
  end 

  it "is event attended of associated user" do 

    creator = User.create(name: "Joffrey")
    event = creator.created_events.create(description:"Eventless", date: Time.now)
    attendee = User.create(name: "Ned")
    event.attendees << [attendee]
    expect(event.attendees).to include attendee 

  end 

  it "has a creator associated" do 
    creator = User.create(name: "The Hound")
    event = creator.created_events.create(description:"Eventless", date: Time.now)
    expect(event.creator).to eq creator

  end 
end
