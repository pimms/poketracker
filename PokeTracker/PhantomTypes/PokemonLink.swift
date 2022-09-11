import Foundation

struct PokemonLinkSpecifier: PhantomSpecifier {
    typealias LiteralValue = URL
}

typealias PokemonLink = PhantomId<PokemonLinkSpecifier>

extension PhantomIdProtocol where PhantomSpecifierType == PokemonLinkSpecifier {
    var request: PokemonRequest {
        PokemonRequest(url: value)
    }
}
