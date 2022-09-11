import Foundation

// https://pokeapi.co/docs/v2#pokemon-location-areas
struct EncounterRequest: APIRequest {
    typealias Model = [EncounterDTO]
    let url: URL

    init(url: URL) {
        self.url = url
    }
}
