import Foundation

struct PokemonDTO: Codable {
    enum CodingKeys: String, CodingKey {
        case isDefault = "is_default"
        case id, order, name, sprites, types
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
        let slot: Int
        let type: TypeDTO
    }

    struct TypeDTO: Codable {
        let name: Type
    }

    let id: Int
    let order: Int
    let name: String
    let isDefault: Bool
    let sprites: Sprites
    let types: [TypeWrapper]
}
