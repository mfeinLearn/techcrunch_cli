class TechcrunchCli::CLI

  def call
    puts "Welcome to Techcrunch"
    list_stories
    menu
  end

  def list_stories
    stories = TechcrunchCli::Story.scrape_titles
    stories.each_with_index do |story, i|
      puts "#{i+1} #{story}"
    end
  end

  def menu
    puts "What story do you want to read?"
    input = gets.strip

    stories = TechcrunchCli::Story.scrape_titles
    authors = TechcrunchCli::Story.scrape_authors
    summaries = TechcrunchCli::Story.scrape_summaries

    if input.to_i-1 <= 10
      story = stories[input.to_i-1]
      author = authors[input.to_i-1]
      summary = summaries[input.to_i-1]

      puts story
      puts
      puts "By: #{author}"
      puts "Summary: #{summary}"
    end
  end
end
