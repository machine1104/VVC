class AddComuneToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :comune, :string
  end
end
