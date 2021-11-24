class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text :image
      t.string :name, null: false
      t.integer :gender, null: false, default: 0
      t.date :birth_date, null: false
      t.integer :address, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.string :detail, null: false
      t.text :body, null: false
      t.string :twitter
      t.string :github
      t.string :qiita
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
