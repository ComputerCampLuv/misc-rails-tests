class Item < ApplicationRecord
  require 'mini_magick'
  searchkick
  paginates_per 9
  has_one_attached :image
  has_many :comments
  belongs_to :user
  has_many :steps, inverse_of: :item
  accepts_nested_attributes_for :steps, reject_if: :all_blank, allow_destroy: true

  def date_created
    self.created_at.strftime("on %d %B %Y")
  end

  def date_updated
    self.updated_at.strftime("on %d %B %Y")
  end
  
  def index_image
    self.image.variant(resize: '1200x2400').processed
  end

  def mini_test
    self.image.variant(combine_options: { gravity: "center", crop: "200x200+0+0" })
  end

  def width
    self.image.metadata[:width]
  end

  def height
    self.image.metadata[:height]
  end

  def aspect_ratio
    self.width / self.height.to_f
  end

  def square_image
    if aspect_ratio > 1
      self.image.variant(combine_options: { gravity: "center", crop: "#{height}x#{height}+0+0" })
    else
      self.image.variant(combine_options: { gravity: "center", crop: "#{width}x#{width}+0+0" })
    end
  end
end
