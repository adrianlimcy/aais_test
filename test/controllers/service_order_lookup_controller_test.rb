require 'test_helper'

class ServiceOrderLookupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get service_order_lookup_index_url
    assert_response :success
  end

end
