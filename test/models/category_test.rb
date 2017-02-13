require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def stepup
    @category = Category.new(name: "sports")
  end

  test "category should be vaild" do
    assert @category.vaild?  
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.vaild?
  end

  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.vaild?
  end

  test "name should not be to long" do
    @category.name = "a" * 26
    assert_not @category.vaild?
  end

  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.vaild?
  end

end  