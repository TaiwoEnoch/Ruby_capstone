require_relative '../Modules/list_source'

describe ListSource do
    describe '#list_source' do
        listSource = ListSource.new
        it 'prints the details of each source' do
            source_data = {"source":"Netflix"}
            expect { listSource.display_source(source_data) }.to output("Source: Netflix\n").to_stdout
        end
    end
end