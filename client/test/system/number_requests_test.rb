require "application_system_test_case"

class NumberRequestsTest < ApplicationSystemTestCase
  setup do
    @number_request = number_requests(:one)
  end

  test "visiting the index" do
    visit number_requests_url
    assert_selector "h1", text: "Number requests"
  end

  test "should create number request" do
    visit number_requests_url
    click_on "New number request"

    fill_in "Input", with: @number_request.input
    fill_in "Response", with: @number_request.response
    click_on "Create Number request"

    assert_text "Number request was successfully created"
    click_on "Back"
  end

  test "should update Number request" do
    visit number_request_url(@number_request)
    click_on "Edit this number request", match: :first

    fill_in "Input", with: @number_request.input
    fill_in "Response", with: @number_request.response
    click_on "Update Number request"

    assert_text "Number request was successfully updated"
    click_on "Back"
  end

  test "should destroy Number request" do
    visit number_request_url(@number_request)
    click_on "Destroy this number request", match: :first

    assert_text "Number request was successfully destroyed"
  end
end
