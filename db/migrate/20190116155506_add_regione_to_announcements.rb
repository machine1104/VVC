class AddRegioneToAnnouncements < ActiveRecord::Migration[5.1]
  def change
    add_column :announcements, :regione, :string
  end
end
