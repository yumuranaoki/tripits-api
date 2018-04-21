require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with name, email, password, password_confirmation" do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end

  it "is invalid without name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without email" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid without password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid without password confirmation" do
    user = User.new(password_confirmation: nil)
    user.valid?
    expect(user.errors[:password_confirmation]).to include("can't be blank")
  end

  it "does not allow email to be duplicated" do
    FactoryBot.create(:user)
    user = User.new(email: "naoki.yumura@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "does not allow password to be shorter than 8" do
    user = User.new(password: "1234")
    user.valid?
    expect(user.errors[:password]).to include("too short")
  end

  it "does not allow password to be longer than 20" do
    user = User.new(password: "a"*21)
    user.valid?
    expect(user.errors[:password]).to include("too long")
  end
end
