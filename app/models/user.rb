class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :ratings

  def name
    [firstname, lastname].join " "
  end
end
