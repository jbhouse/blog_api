class User < ApplicationRecord
  acts_as_token_authenticatable
  has_many :books, foreign_key: :writer_id
  # ^ since our category is going to look for a writer
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
