# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin, type: :model do
  before(:each) do
    Admin.create(
      name: "Bob",
      email: "bob@bob.com",
      role: "basic",
      password: "bob",
      password_confirmation: "bob"
    )
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:role) }
  it { should validate_presence_of(:password_digest) }

  it { should validate_uniqueness_of(:email) }
end
