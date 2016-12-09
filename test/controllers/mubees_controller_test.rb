require 'test_helper'

class MubeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mubee = mubees(:one)
  end

  test "should get index" do
    get mubees_url, as: :json
    assert_response :success
  end

  test "should create mubee" do
    assert_difference('Mubee.count') do
      post mubees_url, params: { mubee: { accepted: @mubee.accepted, budget: @mubee.budget, crew_id: @mubee.crew_id, location: @mubee.location, producer_id: @mubee.producer_id } }, as: :json
    end

    assert_response 201
  end

  test "should show mubee" do
    get mubee_url(@mubee), as: :json
    assert_response :success
  end

  test "should update mubee" do
    patch mubee_url(@mubee), params: { mubee: { accepted: @mubee.accepted, budget: @mubee.budget, crew_id: @mubee.crew_id, location: @mubee.location, producer_id: @mubee.producer_id } }, as: :json
    assert_response 200
  end

  test "should destroy mubee" do
    assert_difference('Mubee.count', -1) do
      delete mubee_url(@mubee), as: :json
    end

    assert_response 204
  end
end
