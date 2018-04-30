class CreateUserPermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_permissions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :permission, index: true, foreign_key: true

      t.timestamps
    end
    add_index :user_permissions, [:permission_id, :user_id], unique: true
  end
end
