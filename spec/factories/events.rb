FactoryBot.define do
  factory :event do
    name {"New Events"}
    description {"<div>Ruby on Rails is not a minimalist framework, ..."}
    event_date {Date.current + 2.days}
    start_time {Time.now}
    end_time {Time.now + 3.hours}
    user
    after(:build) do |news|
      if news.image.attachment.nil?
        news.image.attach(
            io: File.open(Rails.root.join('public', 'default', 'photo.jpeg')),
            filename: 'photo.jpeg',
            content_type: 'photo/jpeg'
        )
      end
    end
  end
end