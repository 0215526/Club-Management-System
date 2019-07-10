FactoryBot.define do
  factory :news do
    title {"New Events"}
    body {"<div>Ruby on Rails is not a minimalist framework, ..."}
    # image {"/assets/images/bg.jpg"}
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