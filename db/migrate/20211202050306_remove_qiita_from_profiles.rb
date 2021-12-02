class RemoveQiitaFromProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :qiita, :string
  end
end
