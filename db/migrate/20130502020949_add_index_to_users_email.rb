class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	add_index :users, :email, unique: true
  end
end

# When a model is generated (such as a User model), a
# migration is automatically created. However, in this
# case we added structure to an existing model, so 
# we use the command:
# $ rails generate migration add_index_to_users_email

# This uses a method called add_index to add an index 
# to the email column of the users table, then enforces
# the uniqueness of each email 

# An index works similar to a book's index. If you
# wanted to find when a book said "foobar" you would
# have to read the entire book, but if you had an index
# you could turn to the index, and it would point you
# to all the pages that have "foobar" on them. Database
# indices work similarly. 