class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :omniauthable 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable, :lockable, :timeoutable, :trackable
  has_many :news
  has_many :events
  has_many :clubs
  has_many :events, through: :clubs
  validates :first_name, :last_name, :dob, :designation, :company, :address, presence: true, length: { minimum: 3 }
  validates :gender, presence: true

  def admin_type
    if self.admin?
      return "Admin"
    else
      return "User"
    end
  end

  def full_name
    return self.first_name+" "+self.last_name
  end
end
