import Foundation

actor PokemonDetailViewModel: ObservableObject {
    private let apiClient = APIClient()
    private let pokemonId: PokemonId

    @MainActor @Published var name: String?
    @MainActor @Published var spriteUrl: URL?
    @MainActor @Published var gameVersions: [GameVersion] = []

    init(pokemonId: PokemonId) {
        self.pokemonId = pokemonId
    }

    func load() async {
        do {
            let pokemon = try await loadPokemon()
            let species = try await loadSpecies(from: pokemon)
            let encounters = try await loadEncounters(from: pokemon)

            await MainActor.run {
                name = species.englishName
                spriteUrl = pokemon.sprites.frontDefault

                let sortedGames = encounters
                    .flatMap({ $0.versionDetails })
                    .map({ $0.version.name })
                    .sorted(by: { a, b in a.rawValue < b.rawValue })
                let unique = Set(sortedGames)
                gameVersions = Array(unique)
            }
        } catch let error {
            print("oh shit: \(error)")
        }
    }

    private func loadPokemon() async throws -> PokemonDTO {
        let request = PokemonRequest(id: pokemonId)
        return try await apiClient.fetchThrowing(request)
    }

    private func loadSpecies(from pokemon: PokemonDTO) async throws -> SpeciesDTO {
        let request = pokemon.species.url.request
        return try await apiClient.fetchThrowing(request)
    }

    private func loadEncounters(from pokemon: PokemonDTO) async throws -> [EncounterDTO] {
        let request = pokemon.locationAreaEncounters.request
        return try await apiClient.fetchThrowing(request)
    }
}
