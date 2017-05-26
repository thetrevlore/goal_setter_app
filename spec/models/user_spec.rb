require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:erick) { User.new(username: 'Erick', password: '654321') }

  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it { should validate_uniqueness_of(:session_token) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "associations" do
    it { should have_many(:goals) }
    it { should have_many(:views) }
    it { should have_many(:comments) }
    it { should have_many(:viewees) }
  end

  # describe "User::find_by_credentials" do
  #   subject(:john) { User.create(username: 'John', password: '123456') }
  #   it "should return user with valid username and password" do
  #     answer = User.find_by_credentials('John', '123456')
  #     expect(answer).to eq(john)
  #   end
  # end



end
