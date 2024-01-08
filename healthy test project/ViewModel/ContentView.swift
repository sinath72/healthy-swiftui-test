//
//  ContentView.swift
//  healthy test project
//
//  Created by sina taherkhani on 2/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var country = Country()
    @State private var data:[CountryInfo] = []
    var body: some View {
        VStack(alignment: .trailing){
            NavigationView{
                Color.blue
                    .ignoresSafeArea()
                    .overlay{
                        List{
                            ForEach(0..<data.count,id: \.self){ i in
                                NavigationLink(destination:country_details(name: data[i].name.common.description)){
                                    HStack(spacing:8.0){
                                        AsyncImage(url: URL(string: data[i].flags.png.description), scale: 8.0) { img in
                                            img
                                        } placeholder: {
                                            ProgressView()
                                        }

                                        Text(data[i].name.common.description)

                                    }
                                }
                            }
                        }.onAppear{
                            country.simpleCountryDelegate = self
                            country.Get()
                        }.navigationTitle("Country List")
                            .navigationBarTitleDisplayMode(.inline)
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension ContentView:CountryProtocol{
    func getData(data: [CountryInfo]) {
        data.sorted { lhs, rhs in
            lhs.name.common < rhs.name.common
        }
        self.data = data
    }
    
    func errors(eroor: Error) {
        print(eroor.localizedDescription)
    }
    
    
}
