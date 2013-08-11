helpers do
  def current_user
    if session[:user_id]
      User.find_by_id(session[:user_id])
    else
      false
    end
  end

  def login
    @user = User.find_by_email(params[:email])
    unless @user.nil?
      if @user.password == params[:password]
        session[:user_id] = @user.id
      else
        redirect '/'
      end
    end
  end
end
