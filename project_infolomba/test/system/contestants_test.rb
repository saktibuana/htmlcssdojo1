require "application_system_test_case"

class ContestantsTest < ApplicationSystemTestCase
  setup do
    @contestant = contestants(:one)
  end

  test "visiting the index" do
    visit contestants_url
    assert_selector "h1", text: "Contestants"
  end

  test "should create contestant" do
    visit contestants_url
    click_on "New contestant"

    fill_in "Contest", with: @contestant.contest_id
    fill_in "User", with: @contestant.user_id
    click_on "Create Contestant"

    assert_text "Contestant was successfully created"
    click_on "Back"
  end

  test "should update Contestant" do
    visit contestant_url(@contestant)
    click_on "Edit this contestant", match: :first

    fill_in "Contest", with: @contestant.contest_id
    fill_in "User", with: @contestant.user_id
    click_on "Update Contestant"

    assert_text "Contestant was successfully updated"
    click_on "Back"
  end

  test "should destroy Contestant" do
    visit contestant_url(@contestant)
    click_on "Destroy this contestant", match: :first

    assert_text "Contestant was successfully destroyed"
  end
end
