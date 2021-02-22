class StatisticsPrinter
  attr_reader :most_viewed, :most_unique_viewed

  def initialize(most_viewed:, most_unique_viewed:)
    @most_viewed = most_viewed
    @most_unique_viewed = most_unique_viewed
  end

  def print_most_viewed_pages
    puts "Most Viewed Pages"
    most_viewed.each do |key,value|
      puts "#{key} : #{value}"
    end
  end

  def print_most_viewed_unique_pages
    puts "Most unique viewed pages"
    most_unique_viewed.each do |key,value|
      puts "#{key} : #{value}"
    end
  end
end
