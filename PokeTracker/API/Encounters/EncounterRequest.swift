import Foundation

// https://pokeapi.co/docs/v2#pokemon-location-areas
struct EncounterRequest: APIRequest {
    typealias Model = [EncounterDTO]
    let url: URL

    init(path: String) {
        self.url = Self.makeUrl(path)
    }
}
