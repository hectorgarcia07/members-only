class AddMemberStatusToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :member, :boolean
  end
end
