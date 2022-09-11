import Foundation

struct EncounterSpecifier: PhantomSpecifier {
    typealias LiteralValue = URL
}

typealias EncounterLink = PhantomId<EncounterSpecifier>

extension PhantomIdProtocol where PhantomSpecifierType == EncounterSpecifier {
    var request: EncounterRequest {
        return EncounterRequest(url: value)
    }
}
