require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'heroes'" do
      visit '/static_pages/home'
      page.should have_content('54footy')
    end
  end
  
  describe "Help page" do

    it "should have the content 'Physios'" do
      visit '/static_pages/help'
      page.should have_content('Physios')
    end
  end
  
  describe "contact page" do

    it "should have the content 'contact'" do
        visit '/static_pages/contact'
        page.should have_content('contact')
    end
  end
  
  describe "About page" do

    it "should have the content 'About'" do
      visit '/static_pages/about'
      page.should have_content('about')
    end
  end
  describe "blog page" do

    it "should have the content 'blog'" do
      visit '/static_pages/blog'
      page.should have_content('blog')
    end
  end    
end