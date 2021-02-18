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
    @values = {}

    file.each do |line|
      address, ip = line.strip.match(PATTERN).captures

      @values[address] ||= {}
      @values[address][ip] ||= 0
      @values[address][ip] += 1
    end

    @values
  end
end