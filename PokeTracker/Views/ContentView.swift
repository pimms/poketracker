//
//  ContentView.swift
//  PokeTracker
//
//  Created by Joakim Stien on 11/09/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PokemonListView()
    }
}

class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }

    #if DEBUG
    @objc class func injected() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.windows.first?.rootViewController =
            UIHostingController(rootView: ContentView())
    }
    #endif
}
