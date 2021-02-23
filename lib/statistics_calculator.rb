class StatisticsCalculator
  attr_reader :values

  def initialize(values:)
    @values = values
  end

  def most_viewed
    calculate_results unless @most_viewed
    @most_viewed
  end

  def most_unique_viewed
    calculate_results unless @most_unique_viewed
    @most_unique_viewed
  end

  private

  def calculate_results
    @most_viewed = {}
    @most_unique_viewed = {}

    values.each do |key,val|
      @most_viewed[key] = val.values.sum
      @most_unique_viewed[key] = val.keys.count
    end

    @most_unique_viewed = @most_unique_viewed.sort_by { |key,value| [value, -key] }.reverse
    @most_viewed = @most_viewed.sort_by { |key,value| value }.reverse
  end
end
