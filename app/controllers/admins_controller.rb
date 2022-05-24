class AdminsController < ApplicationController
  before_action :require_authentication
  before_action :authorize_admin!
  before_action :set_admin!, only: %i[edit update destroy]

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
    @roles = Admin.roles.keys
  end

  def edit
    @roles = Admin.roles.keys
  end

  def update
    if @admin.update admin_params
      redirect_to admins_path
    else
      render :edit
    end
  end

  def create
    @admin = Admin.new admin_params

    if @admin.save
      redirect_to admins_path
    else
      render :new
    end
  end

  def destroy
    @admin.destroy
    redirect_to admins_path
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :name, :role, :password, :password_confirmation)
  end

  def set_admin!
    @admin = Admin.find params[:id]
  end

  def authorize_admin!
    authorize(@admin || Admin)
  end
end
