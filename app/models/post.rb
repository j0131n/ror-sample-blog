class Post < ApplicationRecord
  validates :title, presence: true, length: {minimum:5, maximum:255}
  after_validation :set_slug, only: [:before_create, :update]
  has_many :comments
  # before_create :set_slug
  def set_slug
    # we are going to create a slug here instead from controller
    # and we will set the slug to create and update only
    self.slug = title.to_s.parameterize
  end
end
