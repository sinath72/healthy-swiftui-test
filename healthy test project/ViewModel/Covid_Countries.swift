//
//  2nd View.swift
//  healthy test project
//
//  Created by Macvps on 3/3/23.
//

import SwiftUI

struct Covid_Countries: View {
    @State private var data:[CovidModelElement] = []
    @State private var covid = CovidDetails()
    var body: some View {
        VStack(alignment: .leading) {
            NavigationView {
                Color.cyan
                    .ignoresSafeArea()
                    .overlay{
                        List{
                            ForEach(0..<data.count,id: \.self){ i in
                                NavigationLink(destination: CovidCountryDetails(url: data[i].moreData,name: data[i].country)) {
                                    Text(data[i].country)
                                }
                            }
                        }.onAppear{
                            covid.countryListDelegate = self
                            covid.getCountryList()
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
extension Covid_Countries:CovidCountryProtocol{
    func getData(_ data: [CovidModelElement]) {
        self.data = data
    }
    
    func getErrors(_ error: Error) {
        print(error.localizedDescription)
    }
    
    
}
