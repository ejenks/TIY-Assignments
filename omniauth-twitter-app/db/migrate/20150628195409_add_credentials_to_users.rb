class AddCredentialsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :token, :string
    add_column :users, :secret, :string
    add_column :users, :expires, :boolean
    add_column :users, :expires_at, :datetime
  end
end
