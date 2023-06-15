require_relative '../Modules/list_movie'
require 'stringio'
require 'json'

RSpec.describe ListMovie do
  describe '#list_movies' do
    it 'prints the details of each movie' do
      movies_data = [
        { 'publish_date' => '2022-01-01', 'silent' => true, 'source' => 'Netflix' },
        { 'publish_date' => '2022-02-01', 'silent' => false, 'source' => 'Amazon Prime' }
      ]

      movies_file = StringIO.new(movies_data.map { |data| JSON.generate(data) }.join("\n"))
      allow(File).to receive(:foreach).with('Data/movies.json').and_yield(movies_file)

      expected_output = [
        "Publish Date: 2022-01-01, Silent: true, Source: Netflix\n",
        "Publish Date: 2022-02-01, Silent: false, Source: Amazon Prime\n"
      ]

      expect { subject.list_movies }.to output(expected_output.join).to_stdout_from_any_process
    end
  end
end
