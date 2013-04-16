class UsersController < ApplicationController
  before_filter :only_authenticated_users, only: [:show]

  def show
    @auth
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
  end

end
