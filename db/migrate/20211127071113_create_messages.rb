class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :message_body
      t.references :conversation, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :message_read, default: false

      t.timestamps
    end
  end
end
