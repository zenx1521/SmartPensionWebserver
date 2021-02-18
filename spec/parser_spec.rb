require 'parser'

RSpec.describe Parser do
  let(:parser) do
    Parser.new(file: [
      "/contact 836.973.694.403",
      "/home 444.701.448.104",
      "/about/2 543.910.244.929",
      "/about 715.156.286.412",
      "/contact 184.123.665.067",
      "/home 444.701.448.104",
      "/contact 836.973.694.403",
      "/contact 836.973.694.403"])
  end

  it "Checks values hash size" do
    expect(parser.values.size).to eq(4)
  end

  it "Checks if enters amount for specific ip adress is correct" do
    expect(parser.values["/contact"]["836.973.694.403"]).to eq(3)
  end

  it "Checks if contact hash size is correct" do
    expect(parser.values["/contact"].size).to eq(2)
  end
end
