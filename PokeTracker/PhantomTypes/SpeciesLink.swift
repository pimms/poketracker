import Foundation

struct SpeciesLinkSpecifier: PhantomSpecifier {
    typealias LiteralValue = URL
}

typealias SpeciesLink = PhantomId<SpeciesLinkSpecifier>

extension PhantomIdProtocol where PhantomSpecifierType == SpeciesLinkSpecifier {
    var request: SpeciesRequest {
        SpeciesRequest(url: value)
    }
}
