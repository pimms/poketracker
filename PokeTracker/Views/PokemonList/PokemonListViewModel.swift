import Foundation
import Combine

class PokemonListViewModel: ObservableObject {
    private let apiClient = APIClient()

    @Published var pokemon: [PokemonListEntry] = []

    func load() async {
        let result = await apiClient.fetch(PokemonListRequest())
        guard case .success(let list) = result else {
            fatalError("TODO: Handle error: \(result)")
        }

        let mappedList: [PokemonListEntry] = list.results.map { entry in
            return .unloaded(UnloadedPokemon(name: entry.name, url: entry.url))
        }

        await MainActor.run {
            self.pokemon = mappedList
        }
    }

    func load(_ unloaded: UnloadedPokemon) async {
        print("Loading '\(unloaded.name)'")
        guard let index = pokemon.firstIndex(where: { $0 == .unloaded(unloaded) }) else {
            print("Failed to find index of '\(unloaded.name)'")
            return
        }

        let result = await apiClient.fetch(unloaded.url.request)
        guard case .success(let dto) = result else {
            print("Failed to load '\(unloaded.name)': \(result)")
            return
        }

        let loaded = LoadedPokemon(
            name: dto.name,
            types: dto.types.map({ $0.type.name }),
            spriteUrl: dto.sprites.frontDefault)

        await MainActor.run {
            pokemon[index] = .loaded(loaded)
        }
    }
}
