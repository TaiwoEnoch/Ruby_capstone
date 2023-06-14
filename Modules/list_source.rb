class ListSource
    def list_source
        puts 'Listing all sources...'
        File.foreach('Data/sources.json') do |line|
          source_data = JSON.parse(line)
          puts "Source: #{source_data['source']}"
        end
    end
end
