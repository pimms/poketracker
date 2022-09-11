import Foundation

enum APIError: Error {
    case decodingError(DecodingError)
    case generalError
    case unexpectedStatusCode(Int)
}

class APIClient {
    private let baseUrl: URL = URL(string: "https://pokeapi.co")!
    private let session: URLSession = .shared
    private let decoder = JSONDecoder()

    func fetch<T>(_ request: T) async -> Result<T.Model, APIError> where T: APIRequest {
        do {
            let (data, response) = try await session.data(from: request.url)

            guard let response = response as? HTTPURLResponse else {
                return .failure(.generalError)
            }

            guard response.statusCode >= 200 && response.statusCode <= 299 else {
                return .failure(.unexpectedStatusCode(response.statusCode))
            }

            let model = try decoder.decode(T.Model.self, from: data)
            return .success(model)
        } catch let error as DecodingError {
            return .failure(.decodingError(error))
        } catch _ as NSError {
            return .failure(.generalError)
        }
    }
}
