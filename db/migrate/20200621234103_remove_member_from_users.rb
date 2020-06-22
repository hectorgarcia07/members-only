class RemoveMemberFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :member
  end
end
