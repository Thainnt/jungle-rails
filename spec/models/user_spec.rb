require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create!(
      first_name: "Doge",
      last_name: "Inu",
      email: "pup@doG.com",
      password: "12345678",
      password_confirmation: "12345678"
    )
  end
  
  describe 'Validation' do
    
    it 'should create new user' do
      puts "all: #{User.all.inspect}" 
      expect(User.all.count).to eq(1)
    end

    it 'should have first name, last name, email, password and password confirmation when creating new user' do
      
      expect(@user.first_name).to be_present
      expect(@user.last_name).to be_present
      expect(@user.email).to be_present
      expect(@user.password).to be_present
      expect(@user.password_confirmation).to be_present
    end
    
    it 'should not create new user if have password does not match with password confirmation' do
      
      @user.password_confirmation = "1234"
      
      expect(@user).to_not be_valid
    end
    
    it 'should have unique email, case insensitive for a new user' do
      @user1 = User.create(
        first_name: "Howl",
        last_name: "Pup",
        email: "pup@dog.coM",
        password: "111",
        password_confirmation: "111"
      )

      expect(@user1).to be_invalid
    end
    
    it 'should have password minimum length of 8 characters when creating a new user' do
      @user1 = User.create(
        first_name: "Howl",
        last_name: "Pup",
        email: "poppy@dog.com",
        password: "111",
        password_confirmation: "111"
      )
      expect(@user1).to be_invalid
    end
    
    
  end

  describe '.authenticate_with_credentials' do
    it 'should remove empty leading and trailing spaces in email when user logging in' do
      user1 = User.authenticate_with_credentials("  pup@dog.com ", @user.password)
      puts "user 1: #{user1.inspect}" 
      expect(user1).to eq(@user)
    end

    it 'should allow user to log in with case insensitive email' do
      user1 = User.authenticate_with_credentials("pup@dog.COM", @user.password)
      puts "user 1: #{user1.inspect}" 
      expect(user1).to eq(@user)
    end
  end
end
