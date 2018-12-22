require 'faker'

FactoryBot.define do
  factory :announcement do |f|
    f.user_id { 2 }
    f.titolo { "Playstation 4 500GB" }
    f.categoria { "Elettronica" }
    f.descrizione { "Ps4 vecchia ma non troppo, stagionata!" }
    f.posizione { "posizione" }
    f.email { "pincopallo@gmail.com" }
    f.telefono { "3357416854" }
    f.prezzo { 129 }
  end
end

FactoryBot.define do
  factory :most_recent, class: Announcement do |f|
    f.user_id { 2 }
    f.titolo { "Tavolo in legno 10 posti" }
    f.categoria { "Arredamento" }
    f.descrizione { "Tavolo mai usato, mangiamo per terra!" }
    f.posizione { "posizione" }
    f.email { "pincopallo@gmail.com" }
    f.telefono { "3357416854" }
    f.prezzo { 65 }
  end
end

  FactoryBot.define do
  factory :edited_ad, class: Announcement do |f|
    f.user_id { 2 }
    f.titolo { "nuovo titolo" }
    f.categoria { "Arredamento" }
    f.descrizione { "nuova descrizione" }
    f.posizione { "nuova posizione" }
    f.email { "nuovamail@gmail.com" }
    f.telefono { "800900313" }
    f.prezzo { 65 }
  end
end