class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :twitter
      t.string :github
      t.string :qiita

      t.timestamps
    end
  end
end
