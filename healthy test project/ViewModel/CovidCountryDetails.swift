//
//  CovidCountryDetails.swift
//  healthy test project
//
//  Created by Macvps on 3/4/23.
//

import SwiftUI

struct CovidCountryDetails: View {
    @State var url:String?
    @State var name:String?
    @State private var Infected:String?
    @State private var Deceased:String?
    @State private var Recovered:String?
    @State private var ActiveCase:String?
    @State private var Tested:String?
    @State private var Critical:String?
    @State private var LastUpdatedAtApify:String?
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading){
                    HStack(alignment: .center,spacing: 8.0){
                        Text("Infected Humans:").font(.custom("regular", size: 16.0))
                        Text(Infected ?? "0")
                    }
                    HStack(alignment: .center,spacing: 8.0){
                        Text("Deceased Humans:").font(.custom("regular", size: 16.0))
                        Text(Deceased ?? "0")
                    }
                    HStack(alignment: .center,spacing: 8.0){
                        Text("Recovered Humans:").font(.custom("regular", size: 16.0))
                        Text(Recovered ?? "0")
                    }
                    HStack(alignment: .center,spacing: 8.0){
                        Text("ActiveCase Humans:").font(.custom("regular", size: 16.0))
                        Text(ActiveCase ?? "0")
                    }
                    HStack(alignment: .center,spacing: 8.0){
                        Text("Tested Humans:").font(.custom("regular", size: 16.0))
                        Text(Tested ?? "0")
                    }
                    HStack(alignment: .center,spacing: 8.0){
                        Text("Critical:").font(.custom("regular", size: 16.0))
                        Text(Critical ?? "0")
                    }
                    HStack(alignment: .center,spacing: 8.0){
                        Text("Last Update on:").font(.custom("regular", size: 16.0))
                        Text(LastUpdatedAtApify ?? "0")
                    }
                }
            }.onAppear{
                CovidDetails().getCountryCovidDetails(url: url!) { (infected,deceased,recovered,activeCases,tested,critical,lastUpdatedAtApify) in
                     Infected = infected
                     Deceased = deceased
                     Recovered = recovered
                     ActiveCase = activeCases
                     Tested = tested
                     Critical = critical
                     LastUpdatedAtApify = lastUpdatedAtApify
                }
            }.navigationTitle(name!)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CovidCountryDetails_Previews: PreviewProvider {
    static var previews: some View {
        CovidCountryDetails()
    }
}
