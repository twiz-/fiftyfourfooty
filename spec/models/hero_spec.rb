require 'spec_helper'

describe Hero do
  let (:user) { FactoryGirl.create(:user) }
  before do
    #This code is wrong
    @hero = Hero.new(content: "Bacon ipsum", user_id: user.id)
  end
  
  subject { @hero }
  
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
end
  

