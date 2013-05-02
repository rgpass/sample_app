class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end

# To migrate the database, run the command
# $ bundle exec rake db:migrate

# To reverse a migration, use the command:
# $ bundle exec rake db:rollback
# or can add a VERSION=0 at the end to go to a specific
# version, where 0 is the version desired

# This migration was automatically created when we
# created the User model. See app/models/user.rb for
# more information
