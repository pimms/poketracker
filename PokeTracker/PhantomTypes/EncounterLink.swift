import Foundation

struct EncounterSpecifier: PhantomSpecifier {
    typealias LiteralValue = String
}

typealias EncounterLink = PhantomId<EncounterSpecifier>

extension PhantomIdProtocol where PhantomSpecifierType == EncounterSpecifier {
    var request: EncounterRequest {
        return EncounterRequest(path: value)
    }
}
