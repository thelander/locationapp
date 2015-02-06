class Market < ActiveRecord::Base
  validates_presence_of :name, :description

  has_many :comments, dependent: :destroy
end
