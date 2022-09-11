//
//  PokeTrackerApp.swift
//  PokeTracker
//
//  Created by Joakim Stien on 11/09/2022.
//

import SwiftUI

@main
struct PokeTrackerApp: App {
    init() {
        /*
        #if DEBUG
        var injectionBundlePath = "/Applications/InjectionIII.app/Contents/Resources"
        #if targetEnvironment(macCatalyst)
        injectionBundlePath = "\(injectionBundlePath)/macOSInjection.bundle"
        #elseif os(iOS)
        injectionBundlePath = "\(injectionBundlePath)/iOSInjection.bundle"
        #endif
        Bundle(path: injectionBundlePath)?.load()
        #endif
         */
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
