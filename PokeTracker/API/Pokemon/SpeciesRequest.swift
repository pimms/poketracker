import Foundation

struct SpeciesRequest: APIRequest {
    typealias Model = SpeciesDTO
    let url: URL

    init(url: URL) {
        self.url = url
    }
}
