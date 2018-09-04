# == Schema Information
#
# Table name: dynamics
#
#  id          :bigint(8)        not null, primary key
#  title       :string(255)      not null
#  web_url     :string(255)      not null
#  description :text(65535)
#  visible     :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Dynamic < ApplicationRecord
  validates :title, :web_url, :description, presence: true
  validates_uniqueness_of :title

  scope :visible, -> { where(visible: true) }
  scope :invisible, -> { where(visible: false) }
end