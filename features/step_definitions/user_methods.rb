module UserMethods
    
    def register(user)
    fill_in('user_username', with: user.username)
    fill_in('user_email', with: user.email)
    fill_in('user_password', with: user.password)
    fill_in('user_password_confirmation', with: user.password)
    fill_in('user_comune', with: user.comune)
    fill_in('flatpickr-input', with: user.data_nascita)
  end
  
end

World(UserMethods)