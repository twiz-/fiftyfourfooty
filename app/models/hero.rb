class Hero < ActiveRecord::Base
  belongs_to :user

  attr_accessible :name, :default

end
