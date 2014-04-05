class Idea < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  validates :name,
    length: {
      minimum: 2,
      too_short: "must have at least %{count} words"
    },
    :presence => {:message => "Enter the idea"}
  validates :description, presence: true

  has_many :ratings
end
