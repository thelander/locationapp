class Comment < ActiveRecord::Base
  validates_presence_of :user_id, :content
  validates :content, length: { in: 4..1000 }

  belongs_to :user
  belongs_to :market

  scope :by_date, -> { order created_at: :asc }
end
