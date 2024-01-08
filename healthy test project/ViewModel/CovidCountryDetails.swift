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
    @State private var data:CovidDetailsModel?
    @State private var viewModel = CovidDetails()
    var body: some View {
        NavigationView {
            List {
                VStack(alignment: .leading){
                    HStack(alignment: .center,spacing: 8.0){
                        Text("Infected Humans:").font(.custom("regular", size: 16.0))
                        Text(data?.infected?.description ?? "0")
                    }
                    HStack(alignment: .center,spacing: 8.0){
                        Text("Deceased Humans:").font(.custom("regular", size: 16.0))
                        Text(data?.deceased?.description ?? "0")
                    }
                    HStack(alignment: .center,spacing: 8.0){
                        Text("Recovered Humans:").font(.custom("regular", size: 16.0))
                        Text(data?.recovered?.description ?? "0")
                    }
                    HStack(alignment: .center,spacing: 8.0){
                        Text("ActiveCase Humans:").font(.custom("regular", size: 16.0))
                        Text(data?.activeCases?.description ?? "0")
                    }
                    HStack(alignment: .center,spacing: 8.0){
                        Text("Tested Humans:").font(.custom("regular", size: 16.0))
                        Text(data?.tested?.description ?? "0")
                    }
                    HStack(alignment: .center,spacing: 8.0){
                        Text("Critical:").font(.custom("regular", size: 16.0))
                        Text(data?.critical?.description ?? "0")
                    }
                    HStack(alignment: .center,spacing: 8.0){
                        Text("Last Update on:").font(.custom("regular", size: 16.0))
                        Text(data?.lastUpdatedAtApify ?? "0")
                    }
                }
            }.onAppear{
                viewModel.countryDetailsDelegate = self
                viewModel.getCountryCovidDetails(url: url!)
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
extension CovidCountryDetails:CovidCountryDetailsProtocol{
    func getData(_ data: CovidDetailsModel?) {
        self.data = data
    }
    
    func getErrors(_ error: Error) {
        
    }
}
