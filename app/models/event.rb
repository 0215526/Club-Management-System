class Event < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :clubs
    has_many :users, through: :clubs
    validates :description, presence: true, length: { minimum: 32 }
    validates :name, uniqueness: true, presence: true, length: { minimum: 3 }
    validates :event_date, :start_time, :end_time, presence: true
    validate :image_valid

    def time_start
        return self.start_time.to_s(:time)
    end
    def time_end
        return self.end_time.to_s(:time)
    end
    private
    def image_valid
        if image.attached? == false
            errors.add(:image, "Image Required.")
        elsif !image.content_type.in?(%w(image/jpeg image/png image/jpg))
            errors.add(:image, "must be a JPEG, JPG or PNG.")
        end  
    end
end
