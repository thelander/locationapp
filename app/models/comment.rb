class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :market

  validates_presence_of :user_id, :content
  validates :content, length: { in: 4..1000 }

  scope :by_date, -> { order created_at: :desc }
end
