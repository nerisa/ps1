require 'open-uri'

class TrendingVideosController < ApplicationController

  YOUTUBE_URL = "https://www.youtube.com"
  YOUTUBE_TRENDING_URL = "#{YOUTUBE_URL}/feed/trending?gl=US"
  VIDEO_COUNT = 10

  #Holds the necessary information of the videos
  class Video

    def initialize (link, title, thumbnail)
      @link = link
      @title = title
      @thumbnail = thumbnail
    end

    def get_link
      @link
    end

    def get_title
      @title
    end

    def get_thumbnail
      @thumbnail
    end

  end

  def index
    page = Nokogiri::HTML(open(YOUTUBE_TRENDING_URL))
    video_count = 10
    @videos = Array.new
    video_list = page.css('div.yt-lockup-video')

    if (video_list.length < video_count)
      video_count = video_list.length
    end

    for i in 0..(video_count-1)
      title = video_list[i].css('div.yt-uix-tile h3').css('a').text
      link = "#{YOUTUBE_URL}#{video_list[i].css('div.yt-uix-tile h3').css('a')[0]['href']}"
      thumbnail = video_list[i].css('div.yt-uix-tile').css('div.yt-lockup-thumbnail').css('a').css('div').css('span').css('img')[0]['src']

      #Checks whether the image source is valid
      if !(thumbnail.split("?")[0].include? ".jpg")
        thumbnail = video_list[i].css('div.yt-uix-tile').css('div.yt-lockup-thumbnail').css('a').css('div').css('span').css('img')[0]['data-thumb']
      end

      video_detail = Video.new(link, title, thumbnail)
      @videos << video_detail
    end
  end

end
