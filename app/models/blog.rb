class Blog < ActiveRecord::Base
  belongs_to :category
  attr_accessible :category_id, :content, :published, :title 

  scope :published, where(published: true)
  scope :un_published, where(published: !true)
end
