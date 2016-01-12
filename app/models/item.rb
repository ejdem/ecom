class Item < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader
  
  def self.search(query)
    if query
      where("name like ?", "%#{query}%")
    else
      scoped
    end
  end
  
end
