class User < ActiveRecord::Base
  has_secure_password
  
  has_many :reviews
  has_many :products, :through => :reviews
  has_many :favourites
  has_many :products, :through => :favourites

  before_create :ensure_lowercase_email

  validates :first_name, :last_name, :email, :presence => true
  validates :email, :uniqueness => true

  private

  def ensure_lowercase_email
    self.email = email.downcase
  end

end
