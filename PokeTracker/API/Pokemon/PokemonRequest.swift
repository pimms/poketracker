import Foundation

struct PokemonRequest: APIRequest {
    typealias Model = PokemonDTO
    let url: URL

    init(id: PokemonId) {
        url = Self.makeUrl("/api/v2/pokemon/\(id.value)")
    }

    init(url: URL) {
        self.url = url
    }
}
