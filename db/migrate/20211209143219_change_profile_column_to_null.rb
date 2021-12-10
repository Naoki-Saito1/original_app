class ChangeProfileColumnToNull < ActiveRecord::Migration[6.0]
  def up
    change_column_null :profiles, :body, true
    change_column_null :profiles, :detail, true
  end
  def down
    change_column_null :profiles, :body, false
    change_column_null :profiles, :detail, false
  end
end
