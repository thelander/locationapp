class Market < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates_presence_of :name, :description

  scope :by_date, -> { order created_at: :desc }

  def reviews
    super.by_date
  end

  def average_rating
    if reviews.present?
      reviews.sum(:rating).to_f / reviews.count
    else
      0.0
    end
  end
end
