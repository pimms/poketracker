import Foundation
import SwiftUI

struct PokemonDetailView: View {
    let pokemonId: PokemonId

    var body: some View {
        Text("Pokemon \(pokemonId.value)")
    }
}
