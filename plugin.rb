Onebox = Onebox

module Onebox
  module Engine
    class GarminConnectOnebox
      include Engine
      REGEX = /^https?:\/\/www\.strava\.com\/activities\/[0-9]*\/embed\/[0-9A-Za-z]*/
      matches_regexp REGEX

      def to_html
        "<iframe height='405' width='590' frameborder='0' allowtransparency='true' scrolling='no' src='#{@url}'></iframe>"
      end
    end
  end
end
