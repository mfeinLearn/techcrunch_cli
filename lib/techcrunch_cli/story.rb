class TechcrunchCli::Story
  attr_accessor :title, :author, :summary, :url, :content
  @@all = []

  def self.all
    @@all
  end

  def content
    @content ||= TechcrunchCli::Scraper.new(url).scrape_article
  end

  def open_in_browser
    system("open '#{url}'")
  end
  
  def save
    @@all << self
  end
end
