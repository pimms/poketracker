import Foundation
import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel = PokemonListViewModel()

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.pokemon, id: \.self) { pokemon in
                    switch pokemon {
                    case .unloaded(let unloaded):
                        Text("unloaded: \(unloaded.name)")
                            .onAppear(perform: { Task { await viewModel.load(unloaded) } })
                    case .loaded(let loaded):
                        Text("loaded: \(loaded.name)")
                    }
                }
            }
        }
        .task({ await viewModel.load() })
    }
}
