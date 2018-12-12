module UserMethods
    
  def register(user)
    fill_in('user_username', with: user.username)
    fill_in('user_email', with: user.email)
    fill_in('user_password', with: user.password)
    fill_in('user_password_confirmation', with: user.password)
    fill_in('user_comune', with: user.comune)
    fill_in('flatpickr-input', with: user.data_nascita)
  end

  def login(user)
    fill_in('user_email', with: user.email)
    fill_in('user_password', with: user.password)
  end
  
  def edit(user)
    fill_in('user_nome', with: user.nome)
    fill_in('user_cognome', with: user.cognome)
    fill_in('user_email', with: user.email)
    fill_in('user_comune', with: user.comune)
    fill_in('user_indirizzo', with: user.indirizzo)
  end
  
  def edit_check(user,user_test)
    if user.nome!=user_test.nome
      false
    end
    if user.cognome!=user_test.cognome
      false
    end
    if user.indirizzo!=user_test.indirizzo
      false
    end
    if user.comune!=user_test.comune
      false
    else
      true
    end
  end
  
end

World(UserMethods)