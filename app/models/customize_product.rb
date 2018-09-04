# == Schema Information
#
# Table name: customize_products
#
#  id            :bigint(8)        not null, primary key
#  title         :string(255)      not null
#  intro         :string(255)      default("")
#  keywords      :string(255)      default("")
#  description   :text(65535)
#  images        :string(255)
#  detail_images :string(255)
#  visible       :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class CustomizeProduct < ApplicationRecord
  mount_uploaders :images, PictureUploader
  serialize :images, Array

  validates :title, :intro, :keywords, presence: true
  validates_uniqueness_of :title
  validate :images_not_empty


  scope :visible, -> { where(visible: true) }
  scope :invisible, -> { where(visible: false) }
  scope :not, lambda { |ids| where("id not in (?)", ids) }

  # images不能为空检查
  def images_not_empty
    if images.empty?
      errors.add(:base, '定制图片不能为空，至少需要一张图片')
      return false  
    end
  end
end