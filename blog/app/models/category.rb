class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :writer, class_name: "User"
end
