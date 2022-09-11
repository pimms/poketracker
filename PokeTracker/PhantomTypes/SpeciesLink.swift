import Foundation

struct SpeciesLinkSpecifier: PhantomSpecifier {
    typealias LiteralValue = URL
}

typealias SpeciesLink = PhantomId<PokemonLinkSpecifier>

extension PhantomIdProtocol where PhantomSpecifierType == SpeciesLinkSpecifier {
    var request: SpeciesRequest {
        SpeciesRequest(url: value)
    }
}
