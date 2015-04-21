class User < ActiveRecord::Base

  has_secure_password
  validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true

  has_many :reviews
  has_many :products
  has_many :products, :through => :reviews

end
