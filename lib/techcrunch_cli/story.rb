class TechcrunchCli::Story
  attr_accessor :title, :author, :summary, :href, :content
  
  def self.scrape_titles
    @doc = Nokogiri::HTML(open('http://techcrunch.com/'))

    titles = []
    @doc.search("ul#river1 h2.post-title").each do |h2|
      titles << h2.text
    end
    titles
  end

  def self.scrape_authors
    @doc = Nokogiri::HTML(open('http://techcrunch.com/'))
    authors = @doc.search("ul#river1 div.byline").text.split("by")
    authors
  end

  def self.scrape_summaries
    @doc = Nokogiri::HTML(open('http://techcrunch.com/'))
    summaries = @doc.search("ul#river1 p.excerpt").text
    summaries.split("Read More")
  end
end
