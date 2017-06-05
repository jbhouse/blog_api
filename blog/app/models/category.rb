class Category < ApplicationRecord
  belongs_to :writer, class_name: "User"
end
