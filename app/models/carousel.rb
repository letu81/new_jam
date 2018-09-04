# == Schema Information
#
# Table name: carousels
#
#  id      :bigint(8)        not null, primary key
#  tag     :string(255)      not null
#  images  :string(255)
#  visible :boolean          default(FALSE)
#

class Carousel < ApplicationRecord
  TAG_HOME = "home"
  TAG_PRODUCTS = "products"
  TAG_CUSTOMIZES = "customizes"
  TAG_PARTNERS = "partners"
  mount_uploaders :images, ImageUploader
  serialize :images, Array

  validates :tag, presence: true
  validates_uniqueness_of :tag
  validates :tag, inclusion: {in: ['home', 'products', 'customizes', 'partners']} 
  validate :images_not_empty
  
  scope :visible, -> { where(visible: true) }
  scope :invisible, -> { where(visible: false) }
  scope :home, -> { where(tag: TAG_HOME) }
  scope :products, -> { where(tag: TAG_PRODUCTS) }
  scope :customizes, -> { where(tag: TAG_CUSTOMIZES) }
  scope :partners, -> { where(tag: TAG_PARTNERS) }

  # images不能为空检查
  def images_not_empty
    if images.empty?
      errors.add(:base, '展播图片不能为空，至少需要一张图片')
      return false  
    end
  end
end