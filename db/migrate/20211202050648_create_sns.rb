class CreateSns < ActiveRecord::Migration[6.0]
  def change
    create_table :sns do |t|
      t.string :twitter
      t.string :github
      t.string :qiita

      t.timestamps
    end
  end
end
