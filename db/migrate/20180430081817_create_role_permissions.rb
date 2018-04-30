class CreateRolePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :role_permissions do |t|
      t.references :role, index: true, foreign_key: true
      t.references :permission, index: true, foreign_key: true

      t.timestamps
    end
    add_index :role_permissions, [:role_id, :permission_id], unique: true
  end
end
