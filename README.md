This program can be used for printing out informations about viewers of our website.

to run the program type:

ruby solve_statistics.rb x

x - file path

to run the tests type:

rspec

program classes:

parser: takes a file descriptor as an argument and builds a hash containing log informations.

statistics_calculator: takes a hash obatined from the parser and calculates list of webpages with most page views and most unique page views.

statistics_printer: takes two hash arguments: most_viewed and most_unique_viewed and is used for printing results provided by statistics calculator.