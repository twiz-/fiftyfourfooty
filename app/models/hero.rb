class Hero < ActiveRecord::Base
  has_many :users

  attr_accessible :name, :default

end
