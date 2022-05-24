require 'rails_helper'

RSpec.describe "Genres", type: :request do
  let(:admin) do
    Admin.create(
      name: 'Brad',
      email: 'Brad@email.com',
      password: '222',
      password_confirmation: '222',
    role: :super_admin)
  end

  let(:genre) do
    Genre.create(
    name: 'Physics')
  end

  let(:params) do
    { genre: { name: 'History' } }
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).
      to receive(:current_user).and_return(admin)
  end

  describe "GET /genres for super_admin" do
    it "should show all genres" do
      get genres_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /genres for super_admin" do
    it "should create new genre" do
      post genres_path, params: params
      expect(response).to redirect_to(genres_path)
    end
  end

  describe "PUT /genre/:id for super_admin" do
    it "should update genre" do
      put genre_path(genre), params: params
      expect(response).to redirect_to(genres_path)
    end
  end

  describe "DELETE /genre/:id for super_admin" do
    it "should destroy genre" do
      delete genre_path(genre)
      expect(response).to redirect_to(genres_path)
    end
  end
end

RSpec.describe "Genres", type: :request do
  let(:admin) do
    Admin.create(
      name: 'Brad',
      email: 'Brad@email.com',
      password: '222',
      password_confirmation: '222',
    role: :genre_admin)
  end

  let(:genre) do
    Genre.create(
    name: 'Physics')
  end

  let(:params) do
    { genre: { name: 'History' } }
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).
      to receive(:current_user).and_return(admin)
  end

  describe "POST /genres for genre_admin" do
    it "should create new genre" do
      post genres_path, params: params
      expect(response).to redirect_to(genres_path)
    end
  end
end

RSpec.describe "Genres", type: :request do
  let(:admin) do
    Admin.create(
      name: 'Brad',
      email: 'Brad@email.com',
      password: '222',
      password_confirmation: '222',
    role: :basic)
  end

  let(:genre) do
    Genre.create(
    name: 'Physics')
  end

  let(:params) do
    { genre: { name: 'History' } }
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).
      to receive(:current_user).and_return(admin)
  end

  describe "POST /genres for basic_admin" do
    it "should create new genre" do
      post genres_path, params: params
      expect(response).to redirect_to(genres_path)
    end
  end
end
