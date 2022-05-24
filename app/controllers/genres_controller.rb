class GenresController < ApplicationController
  before_action :require_authentication, except: %i[show index]
  before_action :authorize_genre!
  before_action :set_genre!, only: %i[show destroy edit update]
  after_action :verify_authorized, except: %i[show index]

  def index
    @genres = Genre.all
  end

  def show
    @books = Book.all
  end

  def new
    @genre = Genre.new
    @book = Book.new
  end

  def create
    @books = Book.all
    @genre = Genre.new genre_params

    if @genre.save
      redirect_to genres_path
    else
      redirect_to genres_new_path
    end
  end

  def edit
    @books = Book.all
  end

  def update
    if @genre.update genre_params
      redirect_to genres_path
    else
      render genres_id_path
    end
  end

  def destroy
    @genre.destroy
    redirect_to genres_path
  end

  private

  def set_genre!
    @genre = Genre.find params[:id]
  end

  def genre_params
    params.require(:genre).permit(:name, book_ids: [])
  end

  def genre_name
    params.require(:genre).permit(:name)
  end

  def authorize_genre!
    authorize(@genre || Genre)
  end
end
