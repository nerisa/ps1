require 'open-uri'

class TrendingVideosController < ApplicationController

  YOUTUBE_URL = "https://www.youtube.com/feed/trending?gl=US"

  class Video

    def initialize (link, title, thumbnail)
      @link = link
      @title = title
      # @thumbnail = thumbnail
    end

    def get_link
      @link
    end

    def get_title
      @title
    end

    # def get_thumbnail
    #   @thumbnail
    # end

  end

  def index
    page = Nokogiri::HTML(open(YOUTUBE_URL))
    logger.info page
    logger.info "===================================="
    @videos = Array.new
    video_info = page.css('div.yt-lockup-video')
    if video_info.respond_to?("each")
      video_info.each do |video|
        title = video.css('div.yt-uix-tile h3').css('a').text
        link = video.css('div.yt-uix-tile h3').css("a")[0]["href"]
        video_detail = Video.new(link,title, "bla")
        @videos << video_detail
      end
    else
      logger.info titles
    end

    @videos.each do |video|
      logger.info (">>>>>>>>>>>>>>>>>>>>>")
      logger.info (video.get_link)
    end

  end
end
