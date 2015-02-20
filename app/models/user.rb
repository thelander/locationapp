class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :authentications, dependent: :destroy, inverse_of: :user
  has_many :ratings

  def name
    [firstname, lastname].join " "
  end
end
