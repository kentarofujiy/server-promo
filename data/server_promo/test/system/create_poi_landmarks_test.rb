require "application_system_test_case"

class CreatePoiLandmarksTest < ApplicationSystemTestCase
  setup do
    @create_poi_landmark = create_poi_landmarks(:one)
  end

  test "visiting the index" do
    visit create_poi_landmarks_url
    assert_selector "h1", text: "Create Poi Landmarks"
  end

  test "creating a Create poi landmark" do
    visit create_poi_landmarks_url
    click_on "New Create Poi Landmark"

    fill_in "Poi ", with: @create_poi_landmark.poi_
    click_on "Create Create poi landmark"

    assert_text "Create poi landmark was successfully created"
    click_on "Back"
  end

  test "updating a Create poi landmark" do
    visit create_poi_landmarks_url
    click_on "Edit", match: :first

    fill_in "Poi ", with: @create_poi_landmark.poi_
    click_on "Update Create poi landmark"

    assert_text "Create poi landmark was successfully updated"
    click_on "Back"
  end

  test "destroying a Create poi landmark" do
    visit create_poi_landmarks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Create poi landmark was successfully destroyed"
  end
end
