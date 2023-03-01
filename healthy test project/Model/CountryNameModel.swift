//
//  CountryNameModel.swift
//  healthy test project
//
//  Created by sina taherkhani on 3/1/23.
//

import Foundation
class countryName{
    private var cname:[String]
    init(cname: [String]) {
        self.cname = cname
    }
    func getCountryName() -> [String] {
        return self.cname
    }
}
