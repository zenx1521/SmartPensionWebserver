require_relative 'parser'
require_relative 'statistics_calculator'
require_relative 'statistics_printer'

file_opened_correctly = true
begin
  file = File.open(ARGV[0])
rescue
  file_opened_correctly = false
end

if file_opened_correctly
  parser = Parser.new(file: file)
  statistics_calculator = StatisticsCalculator.new(values: parser.values)
  statistics_printer = StatisticsPrinter.new(
    most_viewed: statistics_calculator.most_viewed,
    most_unique_viewed: statistics_calculator.most_unique_viewed
  )
  statistics_printer.print_most_viewed_pages
  statistics_printer.print_most_viewed_unique_pages
else
  puts "You have provided a wrong file path"
end
