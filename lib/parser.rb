class Parser
  attr_reader :file

  PATTERN = /\A(.*) (\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3})\z/

  def initialize(file:)
    @file = file
  end

  def values
    @values ||= parse
  end

  private

  def parse
    parsed_values = {}

    file.each do |line|
      address, ip = line.strip.match(PATTERN).captures

      parsed_values[address] ||= {}
      parsed_values[address][ip] ||= 0
      parsed_values[address][ip] += 1
    end

    parsed_values
  end
end