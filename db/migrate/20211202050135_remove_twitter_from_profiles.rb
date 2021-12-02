class RemoveTwitterFromProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :twitter, :string
  end
end
