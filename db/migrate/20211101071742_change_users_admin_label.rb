class ChangeUsersAdminLabel < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :admin?, :admin
  end
end
