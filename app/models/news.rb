class News < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    validates :body, presence: true, length: { minimum: 32 }
    validates :title, uniqueness: true, presence: true, length: { minimum: 5 }
    validate :image_valid

    private
    def image_valid
        if image.attached? == false
            errors.add(:image, "Image Required.")
        elsif !image.content_type.in?(%w(image/jpeg image/png image/jpg))
            errors.add(:image, "must be a JPEG, JPG or PNG.")
        end  
    end
end
