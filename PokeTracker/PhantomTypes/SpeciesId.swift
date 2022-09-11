import Foundation

struct SpeciesIdSpecifier: PhantomSpecifier {
    typealias LiteralValue = Int
}

typealias SpeciesId = PhantomId<SpeciesIdSpecifier>
