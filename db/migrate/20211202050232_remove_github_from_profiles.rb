class RemoveGithubFromProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :github, :string
  end
end
