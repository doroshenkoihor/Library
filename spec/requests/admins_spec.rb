require 'rails_helper'

RSpec.describe "Admins", type: :request do
  let(:admin) do
    Admin.create(
      name: 'Brad',
      email: 'Brad@email.com',
      password: '222',
      password_confirmation: '222',
    role: :super_admin)
  end

  let(:some_admin) do
    Admin.create(
      name: 'John',
      email: 'John@email.com',
      password: '12345',
      password_confirmation: '12345',
    role: :basic)
  end

  let(:params) do
    { admin: {
        name: 'Adam',
        email: 'Adam@email.com',
        password: '111',
        password_confirmation: '111',
        role: :basic
    } }
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).
      to receive(:current_user).and_return(admin)
  end

  describe "GET /admins" do
    it "works" do
      get admins_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /admins" do
    it "works" do
      post admins_path, params: params
      expect(response).to redirect_to(admins_path)
    end
  end

  describe "PUT /admin/:id" do
    it "works" do
      put admin_path(some_admin), params: params.merge(id: some_admin.id)
      expect(response).to redirect_to(admins_path)
    end
  end

  describe "DELETE /admin/:id" do
    it "works" do
      delete admin_path(some_admin)
      expect(response).to redirect_to(admins_path)
    end
  end
end
