require "application_system_test_case"
 
class ArticlesTest < ApplicationSystemTestCase
  test "viewing the index" do
    visit articles_path
    assert_selector "h1", text: "Hello, Rails!"
  end
end


