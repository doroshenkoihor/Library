class BookPolicy < ApplicationPolicy
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

  private

  def valid_role?
    user&.basic_role? || user&.book_admin_role? || user&.super_admin_role?
  end
end
