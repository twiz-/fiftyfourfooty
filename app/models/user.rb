# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  remember_token  :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_many :heros

  # returns the default hero
  # This assumes that there is only one hero with the default flag set to true
  # if there is no default hero creates one - NB this newly created hero will not have name!
  def default_hero
    hero = self.heros.select{|hero| hero.default?}.first
    if hero.nil?
      hero = Hero.new(default: true)
      self.heros << hero
    end
    hero
  end

  private

     
   def create_remember_token
     self.remember_token = SecureRandom.urlsafe_base64
   end
end
