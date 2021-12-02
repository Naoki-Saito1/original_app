class ChangeColumnToNull < ActiveRecord::Migration[6.0]
  def up
    change_column_null :profiles, :gender, true
    change_column_null :profiles, :birth_date, true
    change_column_null :profiles, :address, true
    change_column_null :profiles, :status, true
  end
  def down
    change_column_null :profiles, :gender, false
    change_column_null :profiles, :birth_date, false
    change_column_null :profiles, :address, false
    change_column_null :profiles, :status, false
  end
end
