class ReviewPolicy < ApplicationPolicy
  def create?
    @user.present?
  end

  def destroy?
    @user.present? and @record.user == @user
  end
end
