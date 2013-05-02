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

  shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
    # full_title is defined in spec/support/utilities.rb 
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Help page" do
    before { visit help_path }
    let(:heading)    { 'Help' }
    let(:page_title) { 'Help' }
    it_should_behave_like "all static pages"
  end

 	describe "About page" do
    before { visit about_path }
    let(:heading)    { 'About Us' }
    let(:page_title) { 'About Us' }
    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading)    { 'Contact' }
    let(:page_title) { 'Contact' }
    it_should_behave_like "all static pages"
  end

  # This tests to make sure the URI's match the routes
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "sample app"
    page.should have_selector 'title', text: full_title('')
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