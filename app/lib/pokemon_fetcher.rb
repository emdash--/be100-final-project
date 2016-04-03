class PokemonFetcher 
  # going to act as service
  attr_reader :ids

  def initialize
    @ids = (1..10).to_a
  end

  def fetch
    ids.each do |id|
      url = "http://pokeapi.co/api/v2/pokemon/#{id}/"
      results << JSON.parse(RestClient.get(url))
    end

    pokemon_names = []
    pokemon_ids = []

    results.each do |result|
      pokemon_kinds = []

      name = result["name"].capitalize
      pokemon_names << name
      id = result["id"]
      
      pokemon_ids << id

      types = result["types"].each do |type|
        pokemon_kinds << type["type"]["name"].capitalize
      end

    end
    puts pokemon_kinds.inspect

  end

end
