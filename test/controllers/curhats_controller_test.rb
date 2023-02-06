require "test_helper"

class CurhatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @curhat = curhats(:one)
  end

  test "should get index" do
    get curhats_url
    assert_response :success
  end

  test "should get new" do
    get new_curhat_url
    assert_response :success
  end

  test "should create curhat" do
    assert_difference("Curhat.count") do
      post curhats_url, params: { curhat: { description: @curhat.description, tema: @curhat.tema } }
    end

    assert_redirected_to curhat_url(Curhat.last)
  end

  test "should show curhat" do
    get curhat_url(@curhat)
    assert_response :success
  end

  test "should get edit" do
    get edit_curhat_url(@curhat)
    assert_response :success
  end

  test "should update curhat" do
    patch curhat_url(@curhat), params: { curhat: { description: @curhat.description, tema: @curhat.tema } }
    assert_redirected_to curhat_url(@curhat)
  end

  test "should destroy curhat" do
    assert_difference("Curhat.count", -1) do
      delete curhat_url(@curhat)
    end

    assert_redirected_to curhats_url
  end
end
