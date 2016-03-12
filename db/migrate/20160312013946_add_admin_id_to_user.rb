class AddAdminIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :AdminId, :integer
  end
end
