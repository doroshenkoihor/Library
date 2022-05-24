require 'rails_helper'

RSpec.describe "Books", type: :request do
  let(:admin) do
    Admin.create(
      name: 'Brad',
      email: 'Brad@email.com',
      password: '222',
      password_confirmation: '222',
    role: :super_admin)
  end

  let(:book) do
    Book.create(name: 'Somename', author_ids: Author.create(name: "Stiven Sigal").id)
  end

  let(:params) do
    { book: {
        name: 'Another',
        author_ids: [Author.create(name: "Chak Norris").id]
    } }
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).
      to receive(:current_user).and_return(admin)
  end

  describe "GET /books for super_admin" do
    it "should show all books" do
      get books_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /books for super_admin" do
    it "should create new book" do
      post books_path, params: params
      expect(response).to redirect_to(books_path)
    end
  end

  describe "PUT /book/:id for super_admin" do
    it "should update book" do
      put book_path(book), params: params.merge(id: book.id)
      expect(response).to redirect_to(books_path)
    end
  end

  describe "DELETE /book/:id for super_admin" do
    it "should destroy book" do
      delete book_path(book)
      expect(response).to redirect_to(books_path)
    end
  end
end

RSpec.describe "Books", type: :request do
  let(:admin) do
    Admin.create(
      name: 'Brad',
      email: 'Brad@email.com',
      password: '222',
      password_confirmation: '222',
    role: :basic)
  end

  let(:book) do
    Book.create(name: 'Somename', author_ids: Author.create(name: "Stiven Sigal").id)
  end

  let(:params) do
    { book: {
        name: 'Another',
        author_ids: [Author.create(name: "Chack Norris").id]
    } }
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).
      to receive(:current_user).and_return(admin)
  end

  describe "POST /books for super_admin" do
    it "should create new book" do
      post books_path, params: params
      expect(response).to redirect_to(books_path)
    end
  end
end

RSpec.describe "Books", type: :request do
  let(:admin) do
    Admin.create(
      name: 'Brad',
      email: 'Brad@email.com',
      password: '222',
      password_confirmation: '222',
    role: :book_admin)
  end

  let(:book) do
    Book.create(name: 'Somename', author_ids: Author.create(name: "Stiven Sigal").id)
  end

  let(:params) do
    { book: {
        name: 'Another',
        author_ids: [Author.create(name: "Chak Norris").id]
    } }
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).
      to receive(:current_user).and_return(admin)
  end

  describe "POST /books for super_admin" do
    it "should create new book" do
      post books_path, params: params
      expect(response).to redirect_to(books_path)
    end
  end
end
