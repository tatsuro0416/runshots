class Post < ApplicationRecord
  mount_uploaders :pictures, ImageUploader
  has_many_attached :images
  belongs_to :user
  

  validates :caption, presence: true, length: { maximum: 40 }
  validates :description, length: { maximum: 100 }

  # enum
  enum loadtype: { normal: 0, trail: 1, beach: 2, track: 3 }, _prefix: :loadtype
  enum timezone: { morning: 0, daytime: 1, evening: 2, night: 3 }, _prefix: :timezone
  enum updown: { few: 0, less: 1, general: 2, extra: 3, lot: 4 }, _prefix: :updown
  enum trafficlight: { few: 0, less: 1, general: 2, extra: 3, lot: 4 }, _prefix: :trafficlight
  enum crowd: { few: 0, less: 1, general: 2, extra: 3, lot: 4 }, _prefix: :crowd
end
