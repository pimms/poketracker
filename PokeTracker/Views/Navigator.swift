import Foundation
import SwiftUI

enum NavigationItem: Codable, Hashable {
    case pokemon(number: Int)
}

struct Navigator {
    @ViewBuilder
    static func navigation(for item: NavigationItem) -> some View {
        switch item {
        case .pokemon(number: let id):
            Text("Pokemon id: \(id)")
        }
    }
}
