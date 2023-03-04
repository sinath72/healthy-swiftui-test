//
//  2nd View.swift
//  healthy test project
//
//  Created by Macvps on 3/3/23.
//

import SwiftUI

struct Covid_Countries: View {
    @State private var CountryNames:[String]?
    @State private var url:[String]?
    var body: some View {
        VStack(alignment: .leading) {
            NavigationView {
                Color.cyan
                    .ignoresSafeArea()
                    .overlay{
                        List{
                            let count = CountryNames?.count ?? 0
                            ForEach(0..<count,id: \.self){ i in
                                NavigationLink(destination: CovidCountryDetails(url: url![i].description,name: CountryNames![i].description)) {
                                    Text(CountryNames![i].description)
                                }
                            }
                        }.onAppear{
                            CovidDetails().getCountryList { (names,url) in
                                self.CountryNames = names
                                self.url = url
                            }
                        }
                    }.navigationTitle("Covid Countries")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct Covid_Details_Previews: PreviewProvider {
    static var previews: some View {
        Covid_Countries()
    }
}
