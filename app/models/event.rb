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

    def event_categorize
        if Time.now.strftime("%m/%d/%Y") > self.event_date.strftime("%m/%d/%Y")
            return "past"
        elsif Time.now.strftime("%m/%d/%Y") < self.event_date.strftime("%m/%d/%Y")
            return "upcoming"
        else
            if self.start_time.strftime( "%H%M%S%N" ) > Time.now.strftime( "%H%M%S%N" )
                return "upcoming"
            elsif self.end_time.strftime( "%H%M%S%N" ) < Time.now.strftime( "%H%M%S%N" )
                return "past"
            else
                return "current"
            end
        end
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
