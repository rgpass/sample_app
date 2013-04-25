# This is a test page used for Test-Driven Development (TDD)
# which is when you define your Tests first, which will
# obviously fail the first time, then write code to make it
# work out. To run this, use the Terminal prompt:
# bundle exec rspec spec/requests/static_pages_spec.rb
# Can run all specs with: $ bundle exec rspec spec/

# To create another one, use:
# $ rails generate integration_test name_here

# Note: Some of the lines use single-quoted strings and others
# use double-quoted. The only difference is that you cannot
# interpolate single strings. "#{foo}"+"bar" => "foobar" but
# '#{foo}'+'bar' will return "\#{foo} bar"
# Benefit of single quotes is that it's literal and won't interpolate

require 'spec_helper'

describe "Static pages" do

  subject { page }
  describe "Home page" do
    before { visit root_path }
    it { should have_selector('h1', text: 'Sample App') }
    it { should have_selector('title', text: full_title('')) }
    # full_title is defined in spec/support/utilities.rb 
    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Help page" do
    before { visit help_path }
  	it { should have_selector('h1', text: 'Help') }
  	it { should have_selector('title', text: full_title('Help')) }
  end

 	describe "About page" do
    before { visit about_path }
 		it { should have_content('About Us') }
 		it { should have_selector('title', text: full_title('About Us')) }
 	end

  describe "Contact page" do
    before { visit contact_path }
    it { should have_selector('h1', text: 'Contact Us') }
    it { should have_selector('title', text: full_title('Contact Us')) }
  end

end

  # Long-hand for what is above
  # describe "Contact page" do
  #   it "should have the content 'Contact Us'" do
  #     visit contact_path
  #     page.should have_selector('h1', :text => 'Contact Us')
  #   end
  #   it "should have the title 'Contact Us'" do
  #     visit contact_path
  #     page.should have_selector('title', 
  #                       :text => "| Contact Us")
  #   end
  # end