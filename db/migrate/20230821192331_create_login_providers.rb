class CreateLoginProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :login_providers do |t|
      t.string :uid
      t.string :provider
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :login_providers, [:uid, :provider], unique: true
  end
end
