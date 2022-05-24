class AdminPolicy < ApplicationPolicy
  def initialize(user, record = nil)
    @user = user
    @record = record
  end

  def create?
    valid_role?
  end

  def update?
    valid_role?
  end

  def destroy?
    valid_role?
  end

  def index?
    valid_role?
  end

  def show?
    valid_role?
  end

  private

  def valid_role?
    user&.super_admin_role?
  end
end
