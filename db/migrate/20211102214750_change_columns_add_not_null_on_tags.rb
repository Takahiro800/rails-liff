class ChangeColumnsAddNotNullOnTags < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :line_user_id, false
  end
end
