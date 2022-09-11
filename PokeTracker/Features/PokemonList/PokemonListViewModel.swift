import Foundation
import Combine

class PokemonListViewModel: ObservableObject {
    private let apiClient = APIClient()

    @Published var pokemon: [PokemonListEntry] = []

    func load() async {
        print("Loading pokemon list...")
        guard pokemon.isEmpty else {
            print("Has already pokemon list");
            return
        }

        let result = await apiClient.fetch(PokemonListRequest())
        guard case .success(let list) = result else {
            fatalError("TODO: Handle error: \(result)")
        }

        let mappedList: [PokemonListEntry] = list.results.enumerated().map { entry in
            let number = entry.offset + 1
            let pokemon = entry.element
            let unloaded = UnloadedPokemon(number: number, name: pokemon.name, url: pokemon.url)
            return .unloaded(unloaded)
        }

        print("Pokemon list loaded!")
        await MainActor.run {
            self.pokemon = mappedList
        }
    }

    func load(_ unloaded: UnloadedPokemon) async {
        print("Loading '\(unloaded.name)'")

        let result = await apiClient.fetch(unloaded.url.request)
        guard case .success(let dto) = result else {
            print("Failed to load '\(unloaded.name)': \(result)")
            return
        }

        let loaded = LoadedPokemon(
            id: dto.id,
            number: unloaded.number,
            name: dto.name,
            types: dto.types.map({ $0.type.name }),
            spriteUrl: dto.sprites.frontDefault)

        await MainActor.run {
            let index = loaded.number - 1
            pokemon[index] = .loaded(loaded)
        }
    }
}
