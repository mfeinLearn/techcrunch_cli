class TechcrunchCli::Scraper
  def initialize(url = nil)
    @url = url
  end

  def scrape_article
    @doc = Nokogiri::HTML(open(@url))
    @doc.search("div.article-entry").text
  end

  def scrape_articles
    @doc = Nokogiri::HTML(open("https://techcrunch.com"))
    @doc.search("li.river-block").each do |article_li|
      story = TechcrunchCli::Story.new

      a_tag = article_li.search("h2 a")
      if a_tag
        # begin
          story.url = a_tag.attr("href").text
        # rescue NoMethodError
          # binding.pry
        # end
        story.title = article_li.search("h2").text
        story.author = article_li.search("div.byline").text
        story.summary = article_li.search("p.excerpt").text

        story.save
      end
    end
  end

end
