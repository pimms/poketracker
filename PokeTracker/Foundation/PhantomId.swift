import Foundation

protocol PhantomSpecifier {
    associatedtype LiteralValue: Codable, Hashable
}

struct PhantomId<T: PhantomSpecifier>: Hashable, Codable {
    let value: T.LiteralValue

    init(_ value: T.LiteralValue) {
        self.value = value
    }

    init(from decoder: Decoder) throws {
        // value = try T.LiteralValue(from: decoder)
        let container = try decoder.singleValueContainer()
        value = try container.decode(T.LiteralValue.self)
    }

    func encode(to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }
}
