class AddChecksToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :address_check, :boolean, default: false
    add_column :profiles, :gender_check, :boolean, default: false
    add_column :profiles, :birth_date_check, :boolean, default: false
  end
end
