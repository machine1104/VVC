class AddImmagineToAnnouncements < ActiveRecord::Migration[5.1]
  def change
    add_column :announcements, :immagine, :string
  end
end
