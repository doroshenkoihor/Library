class Admin < ApplicationRecord
  enum role: { basic: 0, book_admin: 1, genre_admin: 2, super_admin: 3 }, _suffix: :role
  has_secure_password
  validates :role, presence: true
  validates :password_digest, presence: true
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ ,
                                              message: 'Invalid e-mail! Please provide a valid e-mail address'}, uniqueness: true
end
