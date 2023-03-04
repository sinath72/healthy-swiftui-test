//
//  CovidCountryDetails.swift
//  healthy test project
//
//  Created by Macvps on 3/4/23.
//

import SwiftUI

struct CovidCountryDetails: View {
    @State var url:String?
    var body: some View {
        Text(url!)
    }
}

struct CovidCountryDetails_Previews: PreviewProvider {
    static var previews: some View {
        CovidCountryDetails()
    }
}
