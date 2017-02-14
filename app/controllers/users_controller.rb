class UsersController < ApplicationController
  before_filter :check_authentication
end
