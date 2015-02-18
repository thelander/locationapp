class RatingPolicy < ApplicationPolicy
  def update?
    @user.present?
  end
end
