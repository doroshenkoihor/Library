class GenrePolicy < ApplicationPolicy
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
    valid_role?
  end

  def show?
    true
  end

  private

  def valid_role?
    user&.basic_role? || user&.genre_admin_role? || user&.super_admin_role?
  end
end
