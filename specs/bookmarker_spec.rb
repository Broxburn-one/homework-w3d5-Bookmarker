require('minitest/autorun')
require_relative('../models/bookmarker')

class TestBookmarker < Minitest::Test

  def setup
    options = {
      'title' => 'Twitter',
      'url' =>    'https://twitter.com',
      'genre' =>  'Social Media',
      'details' => 'Used mainly for work'
    }
    @bookmarker = Bookmarker.new(options)

  end

  def test_url
    assert_equal('https://twitter.com', @bookmarker.url())
  end

  def test_title
    assert_equal('Twitter', @bookmarker.title())
  end

  def test_genre
    assert_equal('Social Media', @bookmarker.genre())
  end

  def test_details
    assert_equal('Used mainly for work', @bookmarker.details())
  end

end