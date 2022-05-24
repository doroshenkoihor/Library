class AddRoleToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :role, :integer, default: 0, null: false
    add_index :admins, :role
  end
end
