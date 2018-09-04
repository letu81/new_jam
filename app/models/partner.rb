# == Schema Information
#
# Table name: partners
#
#  id      :bigint(8)        not null, primary key
#  title   :string(255)      not null
#  web_url :string(255)      default("")
#  visible :vip              default(FALSE)
#  visible :boolean          default(FALSE)
#

class Partner < ApplicationRecord
  validates :title, presence: true
  validates_uniqueness_of :title
  
  scope :visible, -> { where(visible: true) }
  scope :invisible, -> { where(visible: false) }

  scope :is_vip, -> { where(vip: true) }
  scope :not_vip, -> { where(vip: false) }

  def url
  	self.web_url.blank? ? "javascript:void(0);" : self.web_url
  end
end