require 'minitest/autorun'

module Onebox
  module Engine
    class StravaOnebox
      attr_accessor :url
      def self.matches_regexp regex
        "stub"
      end
    end
  end
end

require './plugin.rb'

class TestStravaOnebox < Minitest::Test
  def setup
    @box = Onebox::Engine::StravaOnebox.new
    @regex = Onebox::Engine::StravaOnebox::REGEX
  end

  def test_regex
    assert_match @regex, "http://www.strava.com/activities/190948728/embed/7dc1376fba9ec275bf3b41a2df3d423ed2f5c6ae"
    assert_match @regex, "https://www.strava.com/athletes/150922/latest-rides/9debf6ca6f225aa2f987ca2f99b416d78f6b0f49"
    assert_match @regex, "https://www.strava.com/athletes/150922/activity-summary/9debf6ca6f225aa2f987ca2f99b416d78f6b0f49"
  end

  def test_regex_iframe
    assert_match @regex, "<iframe height='454' width='300' frameborder='0' allowtransparency='true' scrolling='no' src='https://www.strava.com/athletes/150922/latest-rides/9debf6ca6f225aa2f987ca2f99b416d78f6b0f49'></iframe>"
  end

  def test_to_html
    @box.url = "http://www.strava.com/activities/23/embed/ab12"
    assert_equal "<iframe height='405' width='590' frameborder='0' allowtransparency='true' scrolling='no' src='http://www.strava.com/activities/23/embed/ab12'></iframe>", @box.to_html
  end

  def test_to_html_iframe
    url = "<iframe height='454' width='300' frameborder='0' allowtransparency='true' scrolling='no' src='https://www.strava.com/athletes/150922/latest-rides/9debf6ca6f225aa2f987ca2f99b416d78f6b0f49'></iframe>"
    @box.url = url
    assert_equal url, @box.to_html

  end
end
