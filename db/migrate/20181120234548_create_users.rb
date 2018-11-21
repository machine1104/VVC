class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :nome
      t.string :cognome
      t.date :data_nascita
      t.string :comune
      t.string :telefono
      t.string :indirizzo

      t.timestamps
    end
  end
end
