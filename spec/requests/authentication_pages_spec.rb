require 'spec_helper'

describe "Authentication" do 
  subject { page }
  
  describe "signin page" do
    before{ visit signin_path }
    
    describe "With valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Who's hungry"
      end
      
      it { should have_selector('title', text: user.name) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
      
      describe "Followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end
    
      
            
    describe "with invalid information" do
      before { click_button "Who's hungry"}
      
      it { should have_selector('title', text: 'Who\'s hungry') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
      
      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end
    
    it { should have_selector('h1',   text: 'Who\'s hungry') }
    it { should have_selector('title', text: 'Who\'s hungry' )}
  end
end
