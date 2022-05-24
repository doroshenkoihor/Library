module Authentication
  extend ActiveSupport::Concern

  included do
    private

    def current_user
      @current_user ||= Admin.find_by(id: session[:admin_id]) if session[:admin_id].present?
    end

    def user_signed_in?
      current_user.present?
    end

    def require_authentication
      return if user_signed_in?
      redirect_to books_path
    end

    def require_no_authentication
      return if !user_signed_in?
      redirect_to books_path
    end

    def sign_in(user)
      session[:admin_id] = user.id
    end

    def sign_out
      session.delete :admin_id
    end

    helper_method :current_user, :user_signed_in?
  end
end
