class AddCorporateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :corporate, :boolean, default: false
  end
end
