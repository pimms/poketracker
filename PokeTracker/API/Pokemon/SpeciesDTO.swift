import Foundation

struct SpeciesDTO: Codable {
    enum CodingKeys: String, CodingKey {
        case evolutionChain = "evolution_chain"
        case evolvesFromSpecies = "evolves_from_species"
        case id, name
    }

    struct EvolutionChainDTO: Codable {
        let url: URL
    }

    struct EvolvesFromDTO: Codable {
        let name: String
        let url: URL
    }

    let id: SpeciesId
    let name: String
    let evolutionChain: EvolutionChainDTO?
    let evolvesFromSpecies: EvolvesFromDTO?
}
