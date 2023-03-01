//
//  GetCountry.swift
//  healthy test project
//
//  Created by sina taherkhani on 2/28/23.
//

import Foundation
import SwiftUI
import SwiftyJSON
struct Country{
    var NameArray:[String] = []
    func Get(){
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        guard let URLL = URL(string: "https://restcountries.com/v3.1/all") else { return}
        let request = NSMutableURLRequest(url: URLL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = session.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                let responseString = try? JSON(data!)
                let count = responseString!.count
                var array:[String] = []
                for i in 0...count{
                    array.append(responseString![i]["name"]["common"].description)
                }
                let final = [countryName(cname: array)]
                ContentView(p: final)
                print(NameArray)
            }
            else {
                // Failure
                
            }
        }
        task.resume()
        session.finishTasksAndInvalidate()
    }
}
