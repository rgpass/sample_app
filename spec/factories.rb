FactoryGirl.define do
	factory :user do
		name			"Gerry Pass"
		email			"rgpass@gmail.com"
		password	"foobar"
		password_confirmation	"foobar"
	end
end

# FactoryGirl is a Gem that replaces User.create
# when testing via RSpec