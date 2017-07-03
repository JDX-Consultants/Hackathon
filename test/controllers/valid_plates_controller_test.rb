require 'test_helper'

class ValidPlatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valid_plate = valid_plates(:one)
  end

  test "should get index" do
    get valid_plates_url
    assert_response :success
  end

  test "should get new" do
    get new_valid_plate_url
    assert_response :success
  end

  test "should create valid_plate" do
    assert_difference('ValidPlate.count') do
      post valid_plates_url, params: { valid_plate: {  } }
    end

    assert_redirected_to valid_plate_url(ValidPlate.last)
  end

  test "should show valid_plate" do
    get valid_plate_url(@valid_plate)
    assert_response :success
  end

  test "should get edit" do
    get edit_valid_plate_url(@valid_plate)
    assert_response :success
  end

  test "should update valid_plate" do
    patch valid_plate_url(@valid_plate), params: { valid_plate: {  } }
    assert_redirected_to valid_plate_url(@valid_plate)
  end

  test "should destroy valid_plate" do
    assert_difference('ValidPlate.count', -1) do
      delete valid_plate_url(@valid_plate)
    end

    assert_redirected_to valid_plates_url
  end
end
