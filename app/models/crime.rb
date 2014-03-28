class Crime < ActiveRecord::Base
  belongs_to :category
  attr_accessible :comment, :image_url, :lat, :level, :lon, :category_id
end
