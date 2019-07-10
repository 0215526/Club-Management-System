require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Associations' do
    # it {should have_one(:image)}
    it {should belong_to(:user)}
    it {should have_many(:clubs)}
    it {should have_many(:users).through(:clubs)}
  end

  describe 'Validations' do
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:event_date)}
    it {should validate_presence_of(:start_time)}
    it {should validate_presence_of(:end_time)}
    it {should validate_length_of(:name).is_at_least(3)}
    it {should validate_length_of(:description).is_at_least(32)}
    it {should validate_uniqueness_of(:name)}
  end

  describe 'Just Time' do
    it 'returns Time Ony from Start Time' do
      event = build(:event, start_time: Time.new.strftime("%Y-%m-%d %H:%M:%S") )
      expect(event.time_start).to eq Time.new.to_s(:time)
    end
    it 'returns Time Ony from End Time' do
      event = build(:event, end_time: Time.new.strftime("%Y-%m-%d %H:%M:%S") )
      expect(event.time_end).to eq Time.new.to_s(:time)
    end
  end

  describe 'Event Category' do
    it 'upcoming' do
      event = build(:event)
      expect(event.event_categorize).to eq 'upcoming'
    end
    it 'past' do
      event = build(:event, event_date: Date.current - 2.days)
      expect(event.event_categorize).to eq 'past'
    end

    it 'upcoming in same day' do
      event = build(:event,  event_date: Date.current, start_time: Time.now + 1.hour )
      expect(event.event_categorize).to eq 'upcoming'
    end
    it 'past in same day ' do
      event = build(:event, event_date: Date.current, start_time: Time.now - 3.hour, end_time: Time.now - 1.hour )
      expect(event.event_categorize).to eq 'past'
    end
    it 'current' do
      event = build(:event, event_date: Date.current, start_time: Time.now - 1.hour, end_time: Time.now + 2.hour )
      expect(event.event_categorize).to eq 'current'
    end
   end
end