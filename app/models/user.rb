class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :omniauthable 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable, :lockable, :timeoutable, :trackable

  validates :first_name, :last_name, :dob, :designation, :company, :address, presence: true, length: { minimum: 3 }
  validates :gender, presence: true

  def admin_type
    if self.admin?
      return "Admin"
    else
      return "User"
    end
  end
end
