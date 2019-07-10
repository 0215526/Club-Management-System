FactoryBot.define do
  factory :event do
    name {"New Events"}
    description {"<div>Ruby on Rails is not a minimalist framework, ..."}
    event_date {Date.current + 2.days}
    start_time {Time.now}
    end_time {Time.now + 3.hours}
    # user {1}
  end
end