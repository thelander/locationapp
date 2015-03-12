class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  validates_presence_of :user, :rating
  validates_inclusion_of :rating, in: 1..5

  scope :by_date, -> { order created_at: :desc }
end
