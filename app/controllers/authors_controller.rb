class AuthorsController < ApplicationController
  before_action :require_authentication, except: %i[show index]
  before_action :authorize_author!
  before_action :set_author!, only: %i[show destroy edit update]
  after_action :verify_authorized, except: %i[show index]

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new author_params

    if @author.save
      redirect_to authors_path
    else
      render authors_new_path
    end
  end

  def update
    if @author.update author_params
      redirect_to authors_path
    else
      render authors_id_path
    end
  end

  def show
    @book = Book.all
  end

  def edit
    @book_author = BookAuthor.new
    @book = Book.all
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  private

  def authorize_author!
    authorize(@author || Author)
  end

  def set_author!
    @author = Author.find_by id: params[:id]
  end

  def author_params
    params.require(:author).permit(:name, book_ids: [])
  end
end
