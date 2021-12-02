class AddProfileIdTolinks < ActiveRecord::Migration[6.0]
  def change
    add_reference :links, :profile, foreign_key: true
  end
end
