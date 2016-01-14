class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, class_name: "Category"
  mount_uploader :image, ImageUploader
  
  def self.search(query)
    if query
      where("name like ?", "%#{query}%")
    else
      scoped
    end
  end
  
end
