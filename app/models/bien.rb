class Bien < ApplicationRecord
  belongs_to :user
  validates :ville, presence: true
  validates :loyé, presence: true
  validates :address, presence: true, uniqueness: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many_attached :images

  def bien_picture
    if images.attached?
      images[0].key
    else
      "bien-par_defaut_shvulu"
    end
  end

  def bien_picture_carousel
    if images.attached?
      # images.each do |image|
        image.key
      # end
    else
      "bien-par_defaut_shvulu"
    end
  end

end
