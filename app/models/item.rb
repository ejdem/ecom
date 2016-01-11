class Item < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader
  
  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end
