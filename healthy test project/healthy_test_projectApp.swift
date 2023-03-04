//
//  healthy_test_projectApp.swift
//  healthy test project
//
//  Created by sina taherkhani on 2/28/23.
//

import SwiftUI

@main
struct healthy_test_projectApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Covid_Countries()
                    .tabItem({
                        Text("Covid Countries").font(.custom("regular", size: 16.0))
                        Image(systemName: "global.fill")
                        .padding()
                    })
                ContentView()
                    .tabItem({
                        Text("Country Details").font(.custom("regular", size: 16.0))
                        Image(systemName: "global")
                            .padding()
                    })
            }
        }
    }
}
