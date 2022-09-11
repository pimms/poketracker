import Foundation

protocol APIRequest {
    associatedtype Model: Codable
    var url: URL { get }
}

extension APIRequest {
    static func url(_ path: String) -> URL {
        return URL(string: "https://pokeapi.co\(path)")!
    }
}
