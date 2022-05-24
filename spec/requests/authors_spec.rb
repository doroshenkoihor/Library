require 'rails_helper'

RSpec.describe "Authors", type: :request do
  let(:admin) do
    Admin.create(
      name: 'Brad',
      email: 'Brad@email.com',
      password: '222',
      password_confirmation: '222',
    role: :super_admin)
  end

  let(:author) do
    Author.create(name: 'Stiven Sigal', book_ids: Book.create(name: "Simple book").id)
  end

  let(:params) do
    { author: {
        name: 'Chack Norris',
        book_ids: [Book.create(name: "Simple book").id]
    } }
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).
      to receive(:current_user).and_return(admin)
  end

  describe "GET /authors for super_admin" do
    it "should show all authors" do
      get authors_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /authors for super_admin" do
    it "should create new author" do
      post authors_path, params: params
      expect(response).to redirect_to(authors_path)
    end
  end

  describe "PUT /author/:id for super_admin" do
    it "should update author" do
      put author_path(author), params: params.merge(id: author.id)
      expect(response).to redirect_to(authors_path)
    end
  end

  describe "DELETE /author/:id for super_admin" do
    it "should destroy author" do
      delete author_path(author)
      expect(response).to redirect_to(authors_path)
    end
  end
end

RSpec.describe "Authors", type: :request do
  let(:admin) do
    Admin.create(
      name: 'Brad',
      email: 'Brad@email.com',
      password: '222',
      password_confirmation: '222',
    role: :basic)
  end

  let(:author) do
    Author.create(name: 'Stiven Sigal', book_ids: Book.create(name: "Simple book").id)
  end

  let(:params) do
    { author: {
        name: 'Chack Norris',
        book_ids: [Book.create(name: "Simple book").id]
    } }
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).
      to receive(:current_user).and_return(admin)
  end

  describe "PUT /author/:id for super_admin" do
    it "should update author" do
      put author_path(author), params: params.merge(id: author.id)
      expect(response).to redirect_to(authors_path)
    end
  end
end
