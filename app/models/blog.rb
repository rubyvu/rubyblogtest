class Blog < ActiveRecord::Base
  belongs_to :category
  has_many :comments

  attr_accessible :category_id, :content, :published, :title, :comments_attributes

  scope :published, where(published: true)
  scope :un_published, where(published: !true)

  validates :category_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  accepts_nested_attributes_for :comments

end
