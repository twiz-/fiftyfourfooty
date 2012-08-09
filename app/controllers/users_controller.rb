class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy] #this makes is a filter that authenticates only a signed in user can edit, see the user index or update their own profile. :)
  before_filter :correct_user,   only: [:edit, :update] # this adds another filter that the right signed in user edits their own data and applies it to 
  before_filter :admin_user,     only: :destroy
  
  def new
    @user = User.new #this creates a new instance of a user form the user class, useful to show a users info in a view
  end
  
  def destroy
    User.find(params[:id]).destroy #this finds the user you want to delete and destroy deletes it
    flash[:success] = "User destroyed, ouch.." # this lets you know the action was completed
    redirect_to users_path #This sends you back to all the users at the end of deletion
  end
  
  def index 
    #Requires signed in user to see all the users
    #@users = User.all is an instance of the user class so we can use it in the view, each method in the controller is a view and the code within it represents what we want that page to do, the model defines what it 'can' do and the view shows it. :)
    @users = User.paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id]) #This retrieves a user from the db by it's id and shows the user info for profile information     

    if @user.default_hero.nil?
      name = params[:q]
    else
      name = @user.default_hero.name
    end

    #@hero_news = Players.find({ q: query, section: 'football' }) #this is a GET request
    @hero_news = Players.find_hero(name)
  end
  
  def edit #@user = User.find(params[:id]) is not needed because of the correct_user filter same with update(1st line taken away)
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success]= "Profile updated, nicely done"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  # @hero_specific = Players.find_hero(params[:name])
  
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Thanks for showing up. It's about time!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # creates or updates the default hero
  def default_hero
    @user = User.find(params[:id])
    hero = @user.default_hero
    if hero.nil?
      # we don't have a default hero so we need to add one'
      hero = Hero.new
      @user.heros << hero
    end
    hero.default = true
    hero.name = params[:name]
    hero.save
    redirect_to @user # shows the user again to see any updates
  end

  private 
  
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
      
    def signed_in_user
      unless signed_in?
        store_location
      redirect_to signin_path, notice: "Sign in first." #This I believe, gets called when there is an error, and redirects user to the sign in page saying sign in first
    end 
    
    def correct_user
      @user = User.find(params[:id]) #this instantiates a user to find it, then redirects the user to home unless its the current user. Replace code in edit and update.
      redirect_to(root_path) unless current_user?(@user) #uses currentuser? defined in helpers/sessions_helper.rb
    end
  end  
end
