import Foundation
import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel = PokemonListViewModel()

    private var items: [GridItem] {
        return Array(repeating: GridItem(.fixed(120)), count: 3)
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: items) {
                ForEach(viewModel.pokemon, id: \.self) { pokemon in
                    switch pokemon {
                    case .unloaded(let unloaded):
                        UnloadedPokemonCell(pokemon: unloaded)
                            .onAppear(perform: { Task { await viewModel.load(unloaded) } })
                    case .loaded(let loaded):
                        LoadedPokemonCell(pokemon: loaded)
                    }
                }
            }
        }
        .task({ await viewModel.load() })
    }
}

private struct SquareView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        GeometryReader { m in
            content
                .frame(width: m.size.width, height: m.size.width)

        }
    }
}

private struct PokemonNumberBackdropLabel: View {
    let number: Int

    var body: some View {
        VStack {
            Spacer()
            Text("\(number)")
                .alignmentGuide(.leading, computeValue: { _ in 0 })
                .font(.system(size: 50))
                .allowsTightening(true)
                .fontWeight(.heavy)
                .opacity(0.15)
                .rotationEffect(.degrees(-10))
        }
    }
}

private struct UnloadedPokemonCell: View {
    let pokemon: UnloadedPokemon

    var body: some View {
        NavigationLink(value: NavigationItem.pokemon(number: pokemon.number)) {
            ZStack {
                PokemonNumberBackdropLabel(number: pokemon.number)
                VStack {
                    Spacer()
                    Text(pokemon.name.capitalized)
                        .font(.caption)
                }
            }.frame(width: 120, height: 100)
        }
    }
}

private struct LoadedPokemonCell: View {
    let pokemon: LoadedPokemon

    var body: some View {
        NavigationLink(value: NavigationItem.pokemon(number: pokemon.number)) {
        ZStack {
            PokemonNumberBackdropLabel(number: pokemon.number)
            AsyncImage(url: pokemon.spriteUrl) { image in
                image
                    .resizable()
                    .frame(width: 64, height: 64)
            } placeholder: { }

            VStack {
                Spacer()
                Text(pokemon.name.capitalized)
                    .font(.caption)
            }
        }
        }.frame(width: 120, height: 100)
    }
}

 struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
