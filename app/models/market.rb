class Market < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  validates_presence_of :name, :description

  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  scope :by_date, -> { order created_at: :desc }

  def comments
    super.by_date
  end

  def rating
    if ratings.present?
      ratings.sum(:score) / ratings.size
    else
      0
    end
  end
end
