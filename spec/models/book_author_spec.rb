# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookAuthor, type: :model do
  it { is_expected.to belong_to(:author) }
  it { is_expected.to belong_to(:book) }
end
