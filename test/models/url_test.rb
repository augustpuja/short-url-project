require "test_helper"

class UrlTest < ActiveSupport::TestCase

  test 'url with valid attributes' do
    url = Url.new(url: 'https://bitly.com/')
    assert url.valid?
  end

  test 'url must be present' do
    url = Url.new(url: '')
    url.valid?
    assert_includes url.errors.messages[:url], 'can\'t be blank'
  end

   test 'short_url must be unique' do
    url = Url.new(url: 'https://bitly.com/',short_url: 'MyString')
    url.valid?
    assert_includes url.errors.messages[:short_url], 'has already been taken'
  end
  
end
