require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with name" do
    user = User.new(name: "Diego", password: "Hey")
    expect(user).to be_valid
  end 
  it "is invalid without name" do 
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end 
  
  it "is invalid with a duplicate name" do
    user = User.create(name: "James")
    user2 = User.new(name: "James")
    user2.valid?
    expect(user2.errors[:name]).to include("has already been taken")
  end 

  it "is attendee of associated event" do 

    creator = User.create(name: "Joffrey")
    event = creator.created_events.create(description:"Eventless", date: Time.now)
    attendee = User.create(name: "Ned")
    event.attendees << [attendee]

    expect(attendee.events_attended).to include event 

  end 

  it "is not attendee of associated event" do 

    creator = User.create(name: "Joffrey")
    event = creator.created_events.create(description:"Eventless", date: Time.now)
    attendee = User.create(name: "Ned")
    event.attendees << [attendee]

    expect(creator.events_attended).to_not include(event) 

  end 

  it "is creator of event" do 
    creator = User.create(name: "Sansa")
    event = creator.created_events.create(description:"Eventless", date: Time.now)
    expect(creator).to eq event.creator
  end 

  it "is not creator of event" do 
    creator = User.create(name: "Sansa")
    event = creator.created_events.create(description:"Eventless", date: Time.now)
    not_creator = User.create(name: "Arya")
    expect(not_creator).to_not eq event.creator
  end 

end
