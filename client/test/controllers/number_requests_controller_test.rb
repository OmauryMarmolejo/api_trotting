require "test_helper"

class NumberRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @number_request = number_requests(:one)
  end

  test "should get index" do
    get number_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_number_request_url
    assert_response :success
  end

  test "should create number_request" do
    assert_difference("NumberRequest.count") do
      post number_requests_url, params: { number_request: { input: @number_request.input, response: @number_request.response } }
    end

    assert_redirected_to number_request_url(NumberRequest.last)
  end

  test "should show number_request" do
    get number_request_url(@number_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_number_request_url(@number_request)
    assert_response :success
  end

  test "should update number_request" do
    patch number_request_url(@number_request), params: { number_request: { input: @number_request.input, response: @number_request.response } }
    assert_redirected_to number_request_url(@number_request)
  end

  test "should destroy number_request" do
    assert_difference("NumberRequest.count", -1) do
      delete number_request_url(@number_request)
    end

    assert_redirected_to number_requests_url
  end
end
