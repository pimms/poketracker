import Foundation

struct PokemonDTO: Codable {
    enum CodingKeys: String, CodingKey {
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case id, order, name, sprites, types, species
    }

    struct Sprites: Codable {
        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
            case frontShiny = "front_shiny"
            case frontFemale = "front_female"
            case frontShinyFemale = "front_shiny_female"
            case backDefault = "back_default"
            case backShiny = "back_shiny"
            case backFemale = "back_female"
            case backShinyFemale = "back_shiny_female"
        }

        let frontDefault: URL?
        let frontShiny: URL?
        let frontFemale: URL?
        let frontShinyFemale: URL?
        let backDefault: URL?
        let backShiny: URL?
        let backFemale: URL?
        let backShinyFemale: URL?
    }

    struct TypeWrapper: Codable {
        struct WrappedType: Codable {
            let name: Type
        }

        let slot: Int
        let type: WrappedType
    }

    struct Species: Codable {
        let name: String
        let url: SpeciesLink
    }

    let id: PokemonId
    let order: Int
    let name: String
    let isDefault: Bool
    let species: Species
    let locationAreaEncounters: EncounterLink
    let sprites: Sprites
    let types: [TypeWrapper]
}

extension PokemonDTO {
    var bestSprite: URL? {
        return sprites.frontDefault
            ?? sprites.frontFemale
            ?? sprites.frontShiny
            ?? sprites.frontShinyFemale
            ?? sprites.backDefault
            ?? sprites.backFemale
            ?? sprites.backShiny
            ?? sprites.backShinyFemale
    }
}
