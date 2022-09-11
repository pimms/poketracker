import Foundation

struct PokemonURLSpecifier: PhantomSpecifier {
    typealias LiteralValue = URL
}

typealias PokemonURL = PhantomId<PokemonURLSpecifier>

extension PokemonURL {
    var request: PokemonRequest {
        PokemonRequest(url: value)
    }
}
