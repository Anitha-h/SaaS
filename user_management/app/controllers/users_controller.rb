class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasant_string
  end

  def create
    #render plain:"hai create"
    user_name = params[:username]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(username: user_name, email: email, password: password)

    response_text = "Hey ,your new user is created with the id #{new_user.id}"
    render plain: response_text
  end

  def login
    email = params[:email]
    password = params[:password]

    if User.exists?(User.where("email=? and password=?", email, password))
      render plain: "true"
    else
      render plain: "false"
    end
  end
end
