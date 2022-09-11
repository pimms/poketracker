import Foundation

struct EncounterDTO: Codable {
    enum CodingKeys: String, CodingKey {
        case versionDetails = "version_details"
    }

    struct VersionDetails: Codable {
        struct Version: Codable {
            let name: GameVersion
            let url: URL
        }

        let version: Version
    }

    let versionDetails: [VersionDetails]
}
