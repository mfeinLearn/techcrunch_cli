require 'nokogiri'
require 'open-uri'
require 'pry'
 #class Story
 class TechcrunchCli::Story
  # We never instantiate instances of Stories.
  # Rather, we just call class methods on this all time.

  # Class Instance Variable
  attr_accessor :title, :author, :summary, :href, :content

  def self.scrape_content(url)
    @doc = Nokogiri::HTML(open(url))
    # binding.pry
    content = @doc.search("div.post-block post-block--image post-block--unread").text.strip
  end

  def self.scrape_urls
    @doc = Nokogiri::HTML(open('https://techcrunch.com/'))
    # binding.pry
    hrefs = [] # always the same
    @doc.search("ul#river1 h2.post-title a").each do |a|
      hrefs << a.attr("href") # different

    end
    hrefs # always the same
  end

  def self.scrape_titles #Done.
    @doc = Nokogiri::HTML(open('https://techcrunch.com/'))
    #binding.pry
    titles = [] # always the same
    @doc.search("h2.post-block__title").each do |h2|
      titles << h2.text.strip # different
    end
    titles # always the same
  end

  def self.scrape_authors
    @doc = Nokogiri::HTML(open('https://techcrunch.com/'))
    #binding.pry
    # authors = @doc.search("span.river-byline__authors a").text.split("by")
    authors = @doc.search("span.river-byline__authors a").last.text.strip.split("by")
    authors
  end

  def self.scrape_summaries
    @doc = Nokogiri::HTML(open('https://techcrunch.com/'))
    summaries = @doc.search("ul#river1 p.excerpt").text
    summaries.split("Read More")
  end
  # self.scrape_content('https://techcrunch.com/')
  # self.scrape_urls
  # self.scrape_authors
  #self.scrape_titles
end
#It's really helpful to have access to pry for nokogiri!
# I also recommend taking a close look at the html of the site you're scraping in the developer console

# notes
# - all text (titles and authors)
# @doc.search("a").text
# - headline and discription
# @doc.search("div").text
# - times and names
#  @doc.search("div.river-byline").text
# - dates
# @doc.search("div.river-byline time.river-byline__time").text


# notes
# You can see that information under "Latest" - beneath the title next to the author
# We would just need to pull that out the same way we're pulling out the title and the author
