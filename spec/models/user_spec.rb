require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @newUser = User.new(:name => "Elmer", :email => "ElMER@elmermail.com", :password => "elmer4you", :password_confirmation => "elmer4you")
    @newUser.save

    @newUser_EmailCheck = User.new(:name => "Elmer", :email => "elmer@elmermail.com", :password => "elmer4you", :password_confirmation => "elmer4you")
    
  end

  describe 'User Validations' do
    it 'should have all fields' do
      expect(@newUser.name).to be_present
      expect(@newUser.email).to be_present
      expect(@newUser.password).to be_present
      expect(@newUser.password_confirmation).to be_present
    end

    it 'should throw error if email already exist' do
      expect(@newUser_EmailCheck).to_not be_valid
      expect(@newUser_EmailCheck.errors.full_messages).to include('Email has already been taken')
    end

    it 'should have a password of atleast 5 characters' do
      expect(@newUser.password.length).to be >= 8
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return user if user info is valid' do
      expect(@newUser.authenticate_self("ElMER@elmermail.com", "elmer4you")).to be_instance_of(User)
    end

    it 'should return nil if the user info is invalid' do
      expect(@newUser.authenticate_self("ElMER@elmermail.com", "elmer5you")).to be_nil
    end

    it 'should return instance of user even with whitespace around email' do
      expect(@newUser.authenticate_self("   ElMER@elmermail.com   ", "elmer4you")).to be_instance_of(User)
    end

    it 'should return instance of user even with incorrect capitalization' do
      expect(@newUser.authenticate_self("ElMER@elmerMail.com", "elmer4you")).to be_instance_of(User)
    end

  end

end