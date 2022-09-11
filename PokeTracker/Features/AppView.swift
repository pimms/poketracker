//
//  ContentView.swift
//  PokeTracker
//
//  Created by Joakim Stien on 11/09/2022.
//

import SwiftUI

struct AppView: View {
    @State var navigationPath: [NavigationItem] = []

    var body: some View {
        NavigationStack(path: $navigationPath) {
            PokemonListView()
                .navigationDestination(for: NavigationItem.self) { item in
                    Navigator.navigation(for: item)
                }
        }
    }
}

class AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }

    #if DEBUG
    @objc class func injected() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.windows.first?.rootViewController =
            UIHostingController(rootView: AppView())
    }
    #endif
}
