import Foundation

struct PokemonListRequest: APIRequest {
    typealias Model = PokemonListDTO
    var url: URL { Self.url("/api/v2/pokemon?limit=\(limit)&offset=\(offset)") }

    private let limit: Int
    private let offset: Int

    init(limit: Int, offset: Int) {
        self.limit = limit
        self.offset = offset
    }

    init() {
        limit = 10000
        offset = 0
    }
}
