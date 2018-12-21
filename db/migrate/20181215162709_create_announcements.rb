class CreateAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :announcements do |t|
      t.references :user, foreign_key: true
      t.string :titolo
      t.string :categoria
      t.text :descrizione
      t.string :posizione
      t.string :email
      t.string :telefono
      t.float :prezzo

      t.timestamps
    end
    add_index :announcements, %i[user_id created_at]
  end
end
