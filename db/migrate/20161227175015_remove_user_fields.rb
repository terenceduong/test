class RemoveUserFields < ActiveRecord::Migration
  def change
    remove_column :iqualify_users, :isFacilitator, :boolean
    remove_column :iqualify_users, :isReadonly, :boolean
  end
end
