# name: strava_onebox
# about: Strava Onebox for embedding strava rides
# version: 1.0
# authors: Ewan McDougall

Onebox = Onebox

module Onebox
  module Engine
    class StravaOnebox
      include Engine
      REGEX = /^https?:\/\/www\.strava\.com\/activities\/[0-9]*\/embed\/[0-9A-Za-z]*/
      matches_regexp REGEX

      def to_html
        "<iframe height='405' width='590' frameborder='0' allowtransparency='true' scrolling='no' src='#{@url}'></iframe>"
      end
    end
  end
end
