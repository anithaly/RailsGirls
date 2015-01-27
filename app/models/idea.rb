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
  belongs_to :category
  has_and_belongs_to_many :tags
  
  accepts_nested_attributes_for :tags

  default_scope :order => 'created_at DESC'
  scope :uncategorized, -> { where(category_id: nil) }

  def self.with_pictures
    where.not(:picture => nil)
  end
end
