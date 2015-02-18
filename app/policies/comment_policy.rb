class CommentPolicy < ApplicationPolicy
  def create?
    @user.present?
  end

  def create?
    @user.present? and @record.user == @user
  end
end
