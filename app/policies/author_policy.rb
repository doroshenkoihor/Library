class AuthorPolicy < ApplicationPolicy
  def initialize(user, record = nill)
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
    true
  end

  def show?
    true
  end

  def valid_role?
    user&.basic_role? || user&.super_admin_role?
  end
end
