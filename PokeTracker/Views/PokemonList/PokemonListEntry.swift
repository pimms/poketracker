import Foundation

struct UnloadedPokemon: Hashable {
    let number: Int
    let name: String
    let url: PokemonLink
}

struct LoadedPokemon: Hashable {
    let number: Int
    let name: String
    let types: [Type]
    let spriteUrl: URL?
}

enum PokemonListEntry: Hashable {
    case unloaded(UnloadedPokemon)
    case loaded(LoadedPokemon)
}
