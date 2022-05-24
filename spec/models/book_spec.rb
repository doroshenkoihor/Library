# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  it { is_expected.to belong_to(:genre).optional }

  it { is_expected.to have_one(:picture_attachment) }

  it { is_expected.to have_many(:authors).through(:book_authors) }
  it { is_expected.to have_many(:book_authors) }

  it { is_expected.to validate_presence_of(:name) }
end
