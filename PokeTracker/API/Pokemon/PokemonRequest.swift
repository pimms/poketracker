import Foundation

struct PokemonRequest: APIRequest {
    typealias Model = PokemonDTO
    let url: URL

    init(id: Int) {
        url = Self.makeUrl("/api/v2/pokemon/\(id)")
    }

    init(name: String) {
        url = Self.makeUrl("/api/v2/pokemon/\(name.lowercased())")
    }

    init(url: URL) {
        self.url = url
    }
}
