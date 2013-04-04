class Category < ActiveRecord::Base
  has_many :blogs
  attr_accessible :description, :name

  validates :name, presence: true, uniqueness: true 
  validates :description, presence: true
end
