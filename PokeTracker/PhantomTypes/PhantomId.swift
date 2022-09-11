import Foundation

protocol PhantomSpecifier {
    associatedtype LiteralValue: Codable, Hashable
}

protocol PhantomIdProtocol {
    associatedtype PhantomSpecifierType: PhantomSpecifier
    var value: PhantomSpecifierType.LiteralValue { get }
}

struct PhantomId<T: PhantomSpecifier>: PhantomIdProtocol, Hashable, Codable {
    typealias PhantomSpecifierType = T

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
