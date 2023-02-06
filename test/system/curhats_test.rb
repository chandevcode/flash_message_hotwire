require "application_system_test_case"

class CurhatsTest < ApplicationSystemTestCase
  setup do
    @curhat = curhats(:one)
  end

  test "visiting the index" do
    visit curhats_url
    assert_selector "h1", text: "Curhats"
  end

  test "should create curhat" do
    visit curhats_url
    click_on "New curhat"

    fill_in "Description", with: @curhat.description
    fill_in "Tema", with: @curhat.tema
    click_on "Create Curhat"

    assert_text "Curhat was successfully created"
    click_on "Back"
  end

  test "should update Curhat" do
    visit curhat_url(@curhat)
    click_on "Edit this curhat", match: :first

    fill_in "Description", with: @curhat.description
    fill_in "Tema", with: @curhat.tema
    click_on "Update Curhat"

    assert_text "Curhat was successfully updated"
    click_on "Back"
  end

  test "should destroy Curhat" do
    visit curhat_url(@curhat)
    click_on "Destroy this curhat", match: :first

    assert_text "Curhat was successfully destroyed"
  end
end
