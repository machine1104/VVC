module UserMethods
    
  def register(user)
    fill_in('user_username', with: user.username)
    fill_in('user_email', with: user.email)
    fill_in('user_password', with: user.password)
    fill_in('user_password_confirmation', with: user.password)
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
  
  def create_announcement(ad)
    fill_in('announcement_titolo', with: ad.titolo)
    fill_in('announcement_descrizione', with: ad.descrizione)
    fill_in('announcement_prezzo', with: ad.prezzo)
    fill_in('announcement_posizione', with: ad.posizione)
    fill_in('announcement_email', with: ad.email)
  end
  
  def edit_ad(ad)
    fill_in('announcement_titolo', with: ad.titolo)
    fill_in('announcement_descrizione', with: ad.descrizione)
    fill_in('announcement_prezzo', with: ad.prezzo)
    fill_in('announcement_posizione', with: ad.posizione)
    fill_in('announcement_email', with: ad.email)
  end
  
  def edit_ad_check(user,ad_test)
    ad = Announcement.where(user_id: user.id).first
    if ad.titolo!=ad_test.titolo
      false
    end
    if ad.descrizione!=ad_test.descrizione
      false
    end
    if ad.email!=ad_test.email
      false
    end
    if ad.posizione!=ad_test.posizione
      false
    end
    if ad.prezzo!=ad_test.prezzo
      false
    else
      true
    end
  end
  
end

World(UserMethods)