FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    first_name {'First'}
    last_name {'Last'}
    gender {'male'}
    dob {'1995-06-06'}
    designation {'Engineer'}
    company {'google'}
    address {'thimphu'}
    password {'12345678'}
    password_confirmation {'12345678'}
    admin {true}
    confirmed_at {Date.today}
  end
end