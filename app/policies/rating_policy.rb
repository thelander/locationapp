class RatingPolicy < ApplicationPolicy
  def update?
    @user
  end
end
