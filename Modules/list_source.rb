class ListSource
  def list_source
    puts 'Listing all sources...'
    return unless File.exist?('Data/sources.json') && !File.empty?('Data/sources.json')

    begin
      file = File.read('Data/sources.json')
      source_data = JSON.parse(file)
      source_data.each do |source|
        puts "Source: #{source['source']}"
      end
    rescue JSON::ParserError => e
      puts "Error parsing sources.json: #{e.message}"
    end
  end
end
