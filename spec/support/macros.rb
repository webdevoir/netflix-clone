def set_current_user(clear=false, user=nil)
  if clear
    session[:user_id] = nil
  else
    session[:user_id] = user || Fabricate(:user).id
  end
end

def current_user
  User.find(session[:user_id])
end

def sign_in(user=nil)
  user = user || Fabricate(:user)
  visit login_path
  fill_in "Email Address", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end
    