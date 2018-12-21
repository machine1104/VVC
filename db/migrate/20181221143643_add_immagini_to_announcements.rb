class AddImmaginiToAnnouncements < ActiveRecord::Migration[5.1]
  def change
    add_column :announcements, :immagine_1, :string
    add_column :announcements, :immagine_2, :string
    add_column :announcements, :immagine_3, :string
    add_column :announcements, :immagine_4, :string
    add_column :announcements, :immagine_5, :string
  end
end
