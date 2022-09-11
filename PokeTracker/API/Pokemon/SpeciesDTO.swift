import Foundation

struct SpeciesDTO: Codable {
    enum CodingKeys: String, CodingKey {
        case evolutionChain = "evolution_chain"
        case evolvesFromSpecies = "evolves_from_species"
        case id, name, names
    }

    struct EvolutionChainDTO: Codable {
        let url: URL
    }

    struct EvolvesFromDTO: Codable {
        let name: String
        let url: URL
    }

    struct NameWrapper: Codable {
        struct Language: Codable {
            let name: String
        }
        let name: String
        let language: Language
    }

    let id: SpeciesId
    let name: String
    let evolutionChain: EvolutionChainDTO?
    let evolvesFromSpecies: EvolvesFromDTO?
    let names: [NameWrapper]
}

extension SpeciesDTO {
    var englishName: String {
        let foundName = names
            .first(where: { $0.language.name == "en" })
            .map({ $0.name })
        return foundName ?? name.capitalized
    }
}
