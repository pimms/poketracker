import Foundation

struct UnloadedPokemon: Hashable {
    let name: String
    let url: PokemonURL
}

struct LoadedPokemon: Hashable {
    let name: String
    let types: [Type]
    let spriteUrl: URL?
}

enum PokemonListEntry: Hashable {
    case unloaded(UnloadedPokemon)
    case loaded(LoadedPokemon)
}
