class PokemonFetcher
  # require 'kind'

  attr_reader :ids

  def initialize
    @ids = (1..151).to_a
  end

  def fetch
    puts "fetched"
    results = []

    @ids.each do |id|
      url = "http://pokeapi.co/api/v2/pokemon/#{id}/"
      results << JSON.parse(RestClient.get(url))
    end
    
    results.each do |result|

      # Insert Pokemon name into Pokemon database
      name = result["name"].capitalize
      pokemon = Pokemon.create(poke_name: name)

      # Get Pokemon's type into Kind database
      types = result["types"].each do |type|
        pokemon_type = type["type"]["name"].capitalize
        
        #checking if kind already exists in data base
        if Kind.exists?(kind: pokemon_type)
          # find Kind 
          kind = Kind.where(kind: pokemon_type)
          pokemon.kinds << kind
        else
          kind = Kind.create(kind: pokemon_type)
          pokemon.kinds << kind
        end
      end
    end

  end

end