//
//  CountryDetails.swift
//  healthy test project
//
//  Created by Macvps on 3/3/23.
//

import SwiftUI

struct country_details: View {
    @State var name:String?
    @State private var data:CountryInfo?
    @State private var county = Country()
    @State private var idd = "0"
    var body: some View {
        VStack(alignment: .trailing) {
            NavigationView {
                List{
                    VStack{
                        HStack(alignment: .center,spacing: 8.0) {
                            Text("Country Name:").font(.custom("regular", size: 12.0))
                            Text(name ?? "0")
                        }
                        HStack(alignment: .center,spacing: 8.0) {
                            Text("Official Country Name:").font(.custom("regular", size: 12.0))
                            Text(data?.name.official ?? "0")
                        }
                        HStack(alignment: .center,spacing: 8.0) {
                            Text("Country Flag:").font(.custom("regular", size: 12.0))
                            AsyncImage(url: URL(string: (data?.flags.png) ?? ""), scale: 8.0) { img in
                                img
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        HStack(alignment: .center,spacing: 8.0) {
                            Text("Country Phone Code:").font(.custom("regular", size: 12.0))
                            Text(idd)
                        }
                        HStack(alignment: .center,spacing: 8.0) {
                            Text("Capital of Country:").font(.custom("regular", size: 12.0))
                            Text(data?.capital![0] ?? "0")
                        }
                        HStack(alignment: .center,spacing: 8.0) {
                            Text("Region of Country:").font(.custom("regular", size: 12.0))
                            Text(data?.region.rawValue ?? "0")
                        }
                        HStack(alignment: .center,spacing: 8.0) {
                            Text("Subregion of Country:").font(.custom("regular", size: 12.0))
                            Text(data?.subregion ?? "0")
                        }
                        HStack(alignment: .center,spacing: 8.0) {
                            Text("Carside Country:").font(.custom("regular", size: 12.0))
                            Text(data?.car.side.rawValue ?? "0")
                        }
                        HStack(alignment: .center,spacing: 8.0) {
                            Text("Population of Country:").font(.custom("regular", size: 12.0))
                            Text(data?.population.description ?? "0")
                        }
                        HStack(alignment: .center,spacing: 8.0) {
                            Text("TimeZone of Country:").font(.custom("regular", size: 12.0))
                            Text(data?.timezones[0] ?? "0")
                        }
                    }
                }
            }.onAppear{
                county.fullCountryDetailsDelegates = self
                county.getDetails(name: name!)
            }.navigationTitle("\(name!) Details")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CountryDetails_Previews: PreviewProvider {
    static var previews: some View {
        country_details()
    }
}
extension country_details:CountryDetailsProtocol{
    func getData(data: CountryInfo) {
        self.data = data
        self.idd = data.idd.root! + data.idd.suffixes!.first!
    }
    
    func errors(eroor: Error) {
        print(eroor.localizedDescription)
    }
    
    
}
