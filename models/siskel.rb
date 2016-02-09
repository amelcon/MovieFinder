require 'httparty'

class Siskel
  attr_reader :title, :rating, :year, :plot, :consensus

  def initialize(title,opts={})
    year = opts[:year]
    @movie = HTTParty.get("http://www.omdbapi.com/?t=#{title}&y=#{year}&plot=full&tomatoes=true")
    @title = @movie['Title']
    @title = @movie["Response"] == "False" ? @movie["Error"] : @title
    @rating = @movie['Rated']
    @year = @movie['Year']
    @plot = @movie['Plot']
    meter = @movie["tomatoMeter"].to_i
    @consensus = meter > 50 ? "Thumbs Up" : "Thumbs Down"
  end
end
