class ApiKey < ActiveRecord::Base
  belongs_to :user
  attr_accessible :access_token

  before_create :generate_access_token
  
  def reset_token
    generate_access_token
    self.save
  end

	private
  
  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end
end
