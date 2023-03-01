//
//  ContentView.swift
//  healthy test project
//
//  Created by sina taherkhani on 2/28/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var p:[countryName]?
    var body: some View {
        VStack {
            let _: () = Country().Get()
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
