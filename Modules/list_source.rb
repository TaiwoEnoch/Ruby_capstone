require 'json'

class ListSource
  def list_source
    puts 'Listing all sources...'
    return unless File.exist?('Data/sources.json') && !File.empty?('Data/sources.json')

    file = File.read('Data/sources.json')
    source_data = JSON.parse(file)
    source_data.each do |source|
      display_source(source)
    end
  end

  def display_source(source_data)
    puts "Source: #{source_data['source']}"
  end
end
