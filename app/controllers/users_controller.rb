class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.library_user
    @users = @users.search(params[:search]) if params[:search].present?
    @query = params[:search]

    respond_to do |format|
      format.html # renders the default HTML view
      format.json { render json: @users }
      format.xml  { render xml: @users }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # renders the default HTML view
      format.json { render json: @user }
      format.xml  { render xml: @user }
    end
  end
end