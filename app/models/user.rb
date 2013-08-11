require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  def authenticate
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      session[:user_id] = @user.id
    else
      redirect '/sessions/new'
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
