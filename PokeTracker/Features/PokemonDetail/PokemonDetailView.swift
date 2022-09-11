import Foundation
import SwiftUI

struct PokemonDetailView: View {
    @StateObject var viewModel: PokemonDetailViewModel

    init(pokemonId: PokemonId) {
        _viewModel = .init(wrappedValue: PokemonDetailViewModel(pokemonId: pokemonId))
    }

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                AsyncImage(url: viewModel.spriteUrl) { image in
                    image.resizable()
                } placeholder: {
                    EmptyView()
                }
                .frame(width: 256, height: 256)

                Text(viewModel.name ?? " ")
                    .font(.title)
                Spacer()
                Text("Found in games:")
                    .font(.title3)
                    .frame(alignment: .leading)
                ForEach(viewModel.gameVersions) { version in
                    Text(version.name)
                        .font(.body)
                        .frame(alignment: .leading)
                }
            }
        }
        .onAppear(perform: { Task { await viewModel.load() } })
    }
}
