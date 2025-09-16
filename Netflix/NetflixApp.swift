//
//  NetflixApp.swift
//  Netflix
//
//  Created by NxtWave on 29/07/25.
//

import SwiftUI

@main
struct NetflixApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {
    @State private var showLogin: Bool = false
    @State private var isSignedIn: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if isSignedIn {
                    netflixtabview()
                } else if showLogin {
                    loginview(onSignedIn: {
                        isSignedIn = true
                    })
                } else {
                    ContentView()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                showLogin = true
                            }
                        }
                }
            }
        }
    }
}


