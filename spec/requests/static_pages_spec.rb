require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1',    text: '54footy') }
    it { should have_selector('title', text: full_title('')) }
    it { should_not have_selector 'title', text: '| Home' }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1',    text: 'Physios') }
    it { should have_selector('title', text: full_title('help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1',    text: 'About me') }
    it { should have_selector('title', text: full_title('about')) }
  end
  
  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1',    text: 'cell') }
    it { should have_selector('title', text: full_title('contact')) }
  end
end