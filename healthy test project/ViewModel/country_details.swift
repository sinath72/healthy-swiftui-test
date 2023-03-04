//
//  CountryDetails.swift
//  healthy test project
//
//  Created by Macvps on 3/3/23.
//

import SwiftUI

struct country_details: View {
    @State var name:String?
    @State private var Official:String?
    @State  private var IMG:String?
    @State  private var IDD:String?
    @State  private var Capital:String?
    @State  private var Region:String?
    @State  private var Subregion:String?
    @State  private var CarSide:String?
    @State  private var TimeZone:String?
    @State  private var Population:String?
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
                            Text(Official ?? "0")
                        }
                        HStack(alignment: .center,spacing: 8.0) {
                            Text("Country Flag:").font(.custom("regular", size: 12.0))
                            AsyncImage(url: URL(string: IMG ?? ""),scale: 8.0)
                        }
                        HStack(alignment: .center,spacing: 8.0) {
                            Text("Country Phone Code:").font(.custom("regular", size: 12.0))
                            Text(IDD ?? "0")
                        }
                        HStack(alignment: .center,spacing: 8.0) {
                            Text("Capital of Country:").font(.custom("regular", size: 12.0))
                            Text(Capital ?? "0")
                        }
                        HStack(alignment: .center,spacing: 8.0) {
                            Text("Region of Country:").font(.custom("regular", size: 12.0))
                            Text(Region ?? "0")
                        }
                        HStack(alignment: .center,spacing: 8.0) {
                            Text("Subregion of Country:").font(.custom("regular", size: 12.0))
                            Text(Subregion ?? "0")
                        }
                        HStack(alignment: .center,spacing: 8.0) {
                            Text("Carside Country:").font(.custom("regular", size: 12.0))
                            Text(CarSide ?? "0")
                        }
                        HStack(alignment: .center,spacing: 8.0) {
                            Text("Population of Country:").font(.custom("regular", size: 12.0))
                            Text(Population ?? "0")
                        }
                        HStack(alignment: .center,spacing: 8.0) {
                            Text("TimeZone of Country:").font(.custom("regular", size: 12.0))
                            Text(TimeZone ?? "0")
                        }
                    }
                }
            }.onAppear{
                DispatchQueue.main.async {
                    Country().getDetails(name: name!, Compilition:{(official,img,idd,capital,region,suregion,carside,timezone,population) in
                        Official = official
                        IMG = img
                        IDD = idd
                        Capital = capital
                        Region = region
                        Subregion = suregion
                        CarSide = carside
                        TimeZone = timezone
                        Population = population
                    })
                }
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
