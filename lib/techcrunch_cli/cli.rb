class TechcrunchCli::CLI

  def call
    puts "Welcome to Techcrunch"
    TechcrunchCli::Scraper.new.scrape_articles
    list_stories
    menu
  end

  def list_stories
    TechcrunchCli::Story.all.each_with_index do |story, i|
      puts "#{i+1} #{story.title}"
    end
  end

  def menu
    input = ""
    while input != "exit"
      puts "What story do you want to read?"
      input = gets.strip

      if input.to_i-1 <= TechcrunchCli::Story.all.size
        story = TechcrunchCli::Story.all[input.to_i-1]

        puts story.title
        puts
        puts "By: #{story.author}"
        puts "Summary: #{story.summary}"

        puts "Would you like to read more?"
        answer = gets.strip

        if ["Y", "YES"].include?(answer.upcase)
          # how do I get the content for this story?
          story.open_in_browser
        end
      end
      puts "Would you like to exit or list again?"
      input = gets.strip
    end
  end
end
