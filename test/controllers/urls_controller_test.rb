require "test_helper"

class UrlsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @url = urls(:one)
  end

  test "should get stats" do
    get stats_path
    assert_response :success
  end

  test 'create new url with 0 clicks' do
    url = Url.create(url: 'https://bitly.com/')
    assert_equal 0, url.clicked
  end

  test 'short url click successfully ' do
    get clicked_path("url_id"=>@url.id), xhr: true
    assert_response :success
  end
end
