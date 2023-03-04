//
//  ContentView.swift
//  healthy test project
//
//  Created by sina taherkhani on 2/28/23.
//

import SwiftUI

struct ContentView: View {    
    @State private var CountryName:[String]?
    var body: some View {
        VStack(alignment: .trailing){
            NavigationView{
                Color.blue
                    .ignoresSafeArea()
                    .overlay{
                        List{
                            let count = CountryName?.count ?? 0
                            ForEach(0..<count,id: \.self){ i in
                                NavigationLink(destination:country_details(name: CountryName![i].description)){
                                    Text(CountryName![i].description)
                                }
                            }
                        }.onAppear{
                            Country().Get { CountryArray in
                                CountryName = CountryArray
                            }
                        }.navigationTitle("Country List")
                            .navigationBarTitleDisplayMode(.inline)
                    }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
