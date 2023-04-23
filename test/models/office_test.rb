require 'test_helper'

class OfficeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @office = Office.new
  end

  test "Office needs attributes" do
    assert_not @office.valid?
  end

  test "Office needs to have a name present" do
    # @user.name = ""
    # @user.address = "12345 something avenue, new york city, 10344"
    #
    # assert_not @user.valid?
  end

  # test "User should be valid with all requirements" do
  #   @user.username = "hello"
  #   @user.password = "12345678"
  #   @user.email = "something@yahoo.com"
  #   assert @user.valid?
  # end
  #
  # test "User needs a proper email address" do
  #   @user.username = "hello"
  #   @user.password = "12345678"
  #   @user.email = "something.com"
  #   assert_not @user.valid?
  # end
  #
  # test "Password needs to be at least 8 letters" do
  #   @user.username = "hello"
  #   @user.password = "1234567"
  #   @user.email = "sdjf@something.com"
  #   assert_not @user.valid?
  # end
  #
  # test "User needs a unique username" do
  #   @user.username = "hello"
  #   @user.password = "12345678"
  #   @user.email = "sdf@something.com"
  #   @user2 = User.new(username: "hello", password: "12345678", email: "something@yahoo.com")
  #   @user2.save
  #   @user.save
  #   assert_not @user.valid?
  # end
  #
  # test "User needs unique username regardless of case_sensitive" do
  #   @user.username = "hello"
  #   @user.password = "12345678"
  #   @user.email = 'sdf@yahoo.com'
  #   @user.save
  #
  #   @user2 = User.new(username: 'Hello', password: '12345678', email: "something@yahoo.com")
  #   assert_not @user2.valid?
  # end
  #
  # test "Password is case sensitive" do
  #   @user.username = "hello"
  #   @user.password = "abcdefg"
  #   @user.email = "dsfd@something.com"
  #   @user.save
  #
  #   assert_not @user.authenticate(password: 'Abcdefg')
  # end


end
