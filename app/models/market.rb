class Market < ActiveRecord::Base
  validates_presence_of :name, :description

  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  scope :by_date, -> { order created_at: :desc }

  def rating
    if ratings.present?
      ratings.sum(:score) / ratings.size
    else
      0
    end
  end
end
