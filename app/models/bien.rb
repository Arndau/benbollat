class Bien < ApplicationRecord
  belongs_to :user
  validates :ville, presence: true
  validates :loyé, presence: true
  validates :address, presence: true, uniqueness: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :image1

  def bien_picture
    if image1.attached?
      image1.key
    else
      "bien-par_defaut_shvulu"
    end
  end

end
