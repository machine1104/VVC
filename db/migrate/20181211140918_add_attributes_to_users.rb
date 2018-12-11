class AddAttributesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nome, :string
    add_column :users, :cognome, :string
    add_column :users, :telefono, :string
    add_column :users, :indirizzo, :string
    add_column :users, :admin, :boolean
  end
end
