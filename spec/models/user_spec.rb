require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_one(:newsfeed) }

    it { should have_one(:profile) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
