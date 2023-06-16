# source_spec.rb
require 'json'
require_relative '../Modules/list_source'

describe ListSource do
  describe '#list_source' do
    it 'prints the details of each source' do
      list_source = ListSource.new
      source_data = { 'source' => 'Netflix' }
      expect { list_source.display_source(source_data) }.to output("Source: Netflix\n").to_stdout
    end
  end
end
