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
                ContentView()
                    .tabItem({
                        Text("main")
                    })
                s2nd_View()
                    .tabItem({
                        Text("another View")
                    })
            }
        }
    }
}
