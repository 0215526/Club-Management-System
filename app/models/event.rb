class Event < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :clubs
    has_many :users, through: :clubs
    validates :description, presence: true, length: { minimum: 32 }
    validates :name, uniqueness: true, presence: true, length: { minimum: 3 }
    validates :event_date, :start_time, :end_time, presence: true
    validate :image_valid
    validate :time_validate
    # validates :image, attached: true

    def time_start
        self.start_time.to_s(:time)
    end

    def time_end
        self.end_time.to_s(:time)
    end

    def event_categorize
        # binding.pry
        if event_date.past?
            "past"
        elsif event_date.future?
            "upcoming"
        else
            if start_time.strftime( "%H%M%S%N" ) > Time.now.strftime( "%H%M%S%N" )
                return "upcoming"
            elsif end_time.strftime( "%H%M%S%N" ) < Time.now.strftime( "%H%M%S%N" )
                return "past"
            else
                return "current"
            end
        end
    end

    private
    def image_valid
        if !image.attached?
            errors.add(:image, "Image Required.")
        elsif !image.content_type.in?(%w(image/jpeg image/png image/jpg))
            errors.add(:image, "must be a JPEG, JPG or PNG.")
        end  
    end

    def time_validate
        if start_time.to_i>=end_time.to_i
            errors.add(:end_time, "End Time should greater than Start Time")
        end
    end
end
