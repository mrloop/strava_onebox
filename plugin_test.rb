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
  end

  def test_to_html

    @box.url = "http://www.strava.com/activities/23/embed/ab12"
    assert_equal "<iframe height='405' width='590' frameborder='0' allowtransparency='true' scrolling='no' src='http://www.strava.com/activities/23/embed/ab12'></iframe>", @box.to_html
  end
end
