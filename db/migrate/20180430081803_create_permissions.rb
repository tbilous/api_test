class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.string :type, null: false
      t.string :slug, null: false

      t.timestamps
    end
    add_index :permissions, [:type, :slug], unique: true
  end
end
