class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :role
  has_secure_password
  validates_presence_of :email, :on => :create

  def is_admin?
  	role=="admin"
  end
end
