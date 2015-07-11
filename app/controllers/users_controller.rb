class UsersController < ApplicationController

  def create

  end

  def new

    render 'devise/registrations/new'
  end

end

