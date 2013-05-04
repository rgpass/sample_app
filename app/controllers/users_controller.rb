class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
end

# Generated with the command:
# $ rails generate controller Users new --no-test-framework
# This created a controller named Users and defined an action
# called new. We added the --no-test-framework so that we
# could define our own via RSpec
# Note: Controllers use a plural context 'Users' whereas the
# model uses singular 'User'