require_relative '../Modules/list_source'

describe ListSource do
    it 'Lists all sources' do
        source = ListSource.new
        expect(source.list_sources).to be_a(ListSource)
    end
end