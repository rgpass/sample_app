class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
  end
end

# Generated via the command:
# $ rails generate migration add_password_digest_to_users password_digest:string
# By adding _to_users, Rails automagically constructs
# a migration to add columns to the users table