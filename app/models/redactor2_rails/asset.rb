class Redactor2Rails::Asset < ActiveRecord::Base
  include Redactor2Rails::Orm::ActiveRecord::AssetBase

  self.table_name = "redactor_assets"

  delegate :url, :current_path, :size, :content_type, :filename, to: :data
  validates_presence_of :data
end