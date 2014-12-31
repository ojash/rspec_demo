class User < ActiveRecord::Base
  validates :name, presence: true
  validates :gender, inclusion: { in: ['male','female'] }

  has_many :photos, dependent: :destroy

  def self.get_gender(gender)
    where gender: gender
  end

  def total_photos
    self.photos.count
  end
end
