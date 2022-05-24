class SessionsController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: :destroy

  def new
  end

  def create
    admin = Admin.find_by email: params[:email]

    if admin&.authenticate(params[:password])
      sign_in admin
      redirect_to books_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    sign_out
    redirect_to books_path
  end
end
