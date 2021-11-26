class CreateFrameworks < ActiveRecord::Migration[6.0]
  def change
    create_table :frameworks do |t|
      t.string :framework_name
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
