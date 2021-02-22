require 'statistics_calculator'

RSpec.describe StatisticsCalculator do
  let(:statistics_calculator) do
    parser = Parser.new(file: [
      "/contact 836.973.694.403",
      "/home 444.701.448.104",
      "/about/2 543.910.244.929",
      "/about 715.156.286.412",
      "/contact 184.123.665.067",
      "/home 444.701.448.104",
      "/contact 836.973.694.403",
      "/contact 836.973.694.403",
      "/about/2 235.313.352.950",
      "/home 555.576.836.194"])

    StatisticsCalculator.new(values: parser.values)
  end

  let(:most_unique_viewed_example_stats) do
    {
      "/about/2"=>2,
      "/home"=>2,
      "/about"=> 1,
      "/contact"=>2
    }
  end

  let(:most_viewed_example_stats) do
    {
      "/home"=>3,
      "/about/2"=>2,
      "/about"=> 1,
      "/contact"=>4
    }
  end

  it "Checks if most_viewed field size is correct" do
    expect(statistics_calculator.most_viewed.size).to eq(4)
  end

  it "Checks if most_viewed statistics are counted correctly" do
    expect(statistics_calculator.most_viewed.to_h).to eq(most_viewed_example_stats)
  end

  it "Checks if most_unique_viewed field size is correct" do
    expect(statistics_calculator.most_unique_viewed.size).to eq(4)
  end

  it "Checks if most_unique_viewed statistics are counted correctly" do
    expect(statistics_calculator.most_unique_viewed.to_h).to eq(most_unique_viewed_example_stats)
  end
end
