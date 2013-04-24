# This is a test page used for Test-Driven Development (TDD)
# which is when you define your Tests first, which will
# obviously fail the first time, then write code to make it
# work out. To run this, use the Terminal prompt:
# bundle exec rspec spec/requests/static_pages_spec.rb

# Note: Some of the lines use single-quoted strings and others
# use double-quoted. The only difference is that you cannot
# interpolate single strings. "#{foo}"+"bar" => "foobar" but
# '#{foo}'+'bar' will return "\#{foo} bar"
# Benefit of single quotes is that it's literal and won't interpolate

require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    it "should have the content 'Sample App'" do
    	visit '/static_pages/home'
    	page.should have_selector('h1', :text => 'Sample App')
    end
    it "should have the right title" do
    	visit '/static_pages/home'
    	page.should have_selector('title', 
    										:text => "Ruby on Rails Tutorial Sample App")
    end
    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| Home')
    end

  end

  describe "Help page" do
  	it "should have the content 'Help'" do
  		visit '/static_pages/help'
  		page.should have_selector('h1', :text => 'Help')
  	end
  	it "should have the title 'Help'" do
  		visit '/static_pages/help'
  		page.should have_selector('title', 
  											:text => "| Help")
  	end
  end

 	describe "About page" do
 		it "should have the content 'About us'" do
 			visit '/static_pages/about'
 			page.should have_content('About Us')
 		end
 		it "should have the title 'About Us'" do
 			visit '/static_pages/about'
 			page.should have_selector('title', 
 												:text => "| About Us")
 		end
 	end

  describe "Contact page" do
    it "should have the content 'Conctact Us'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', :text => 'Contact Us')
    end
    it "should have the title 'Contact Us'" do
      visit '/static_pages/contact'
      page.should have_selector('title', 
                        :text => "| Contact Us")
    end
  end

end
