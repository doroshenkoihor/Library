class BooksController < ApplicationController
  before_action :require_authentication, except: %i[show index]
  before_action :authorize_book!
  after_action :verify_authorized, except: %i[show index]
  before_action :fetch_authors, only: %i[new edit show]
  before_action :set_book!, only: %i[show destroy edit update]

  def destroy
    @book.destroy
    redirect_to books_path
  end

  def edit
    @book_author = BookAuthor.new
    @genres = Genre.all
  end

  def update
    if @book.update book_params
      redirect_to books_path
    else
      render books_id_path
    end
  end

  def index
    @books_by_genres = Genre.includes(:books).map do |genre|
      { name: genre.name, books: genre.books }
    end

    @books_by_genres.push({ name: "Books without a genre:", books: Book.where(genre_id: nil) })
  end

  def show
    @authors = Author.all
    @genres = Genre.all
  end

  def new
    @book = Book.new
    @book_author = BookAuthor.new
    @genres = Genre.all
  end

  def create
    @book = Book.new book_params

    if @book.save
      redirect_to books_path
    else
      render new_book_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :genre_id, :picture, author_ids: [])
  end

  def set_book!
    @book = Book.find params[:id]
  end

  def fetch_authors
    @authors = Author.all
  end

  def authorize_book!
    authorize(@book || Book)
  end
end
