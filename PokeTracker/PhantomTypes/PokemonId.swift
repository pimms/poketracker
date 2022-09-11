import Foundation

struct PokemonIdSpecifier: PhantomSpecifier {
    typealias LiteralValue = Int
}

typealias PokemonId = PhantomId<PokemonIdSpecifier>
