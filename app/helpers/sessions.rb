helpers do
  def current_user
    if session[:user_id]
      User.find_by_id(session[:user_id])
    else
      false
    end
  end
end
