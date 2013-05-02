class UsersController < ApplicationController
  def new
  end
end

# Generated with the command:
# $ rails generate controller Users new --no-test-framework
# This created a controller named Users and defined an action
# called new. We added the --no-test-framework so that we
# could define our own via RSpec
# Note: Controllers use a plural context 'Users' whereas the
# model uses singular 'User'