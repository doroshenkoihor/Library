class Book < ApplicationRecord
  has_one_attached :picture
  has_many :book_authors
  has_many :authors, through: :book_authors
  belongs_to :genre, optional: true

  validates :name, presence: true
  validates :author_ids, presence: true
end
