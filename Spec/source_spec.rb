require_relative '../Modules/list_source'

describe ListSource do
  describe '#list_source' do
    list_source = ListSource.new
    it 'prints the details of each source' do
      source_data = { source: 'Netflix' }
      expect { list_source.display_source(source_data) }.to output("Source: Netflix\n").to_stdout
    end
  end
end
