class Category < ActiveRecord::Base
    has_many :items, class_name: "Item"
end
