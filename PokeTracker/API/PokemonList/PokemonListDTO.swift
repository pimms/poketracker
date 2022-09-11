import Foundation

struct PokemonListDTO: Codable {
    struct Entry: Codable {
        let name: String
        let url: PokemonLink
    }

    let count: Int
    let next: URL?
    let previous: URL?
    let results: [Entry]
}
