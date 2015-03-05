class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  validates_presence_of :user, :content, :rating
  validates :content, length: { in: 4..1000 }

  scope :by_date, -> { order created_at: :desc }
end
