# name: strava_onebox
# about: Strava Onebox for embedding strava rides
# version: 1.0
# authors: Ewan McDougall

Onebox = Onebox

module Onebox
  module Engine
    class StravaOnebox
      include Engine
      REGEX = /^(?:<iframe .* src=')?https?:\/\/www\.strava\.com\/(activities|athletes)\/[0-9]*\/(activity-summary|embed|latest-rides)\/[0-9A-Za-z]*(?:'><\/iframe>)?/
      matches_regexp REGEX

      def is_iframe?
        @url.include? "iframe"
      end

      def is_activity?
        @url.include? "activities"
      end

      def is_latest?
        @url.include? "latest-rides"
      end

      def is_summary?
        @url.include? "activity-summary"
      end

      def height
        return 405 if is_activity?
        return 454 if is_latest?
        return 160 if is_summary?
      end

      def width
        return 590 if is_activity?
        return 300 if is_latest?
        return 300 if is_summary?
      end

      def to_html
        if is_iframe?
          @url
        else
          "<iframe height='#{height}' width='#{width}' frameborder='0' allowtransparency='true' scrolling='no' src='#{@url}'></iframe>"
        end
      end
    end
  end
end
