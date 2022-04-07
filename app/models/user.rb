class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :biens, dependent: :destroy
  has_one_attached :avatar


  def profile_picture
    if avatar.attached?
      avatar.key
    else
      "default_profile_pic_xl837y"
    end
  end

end
