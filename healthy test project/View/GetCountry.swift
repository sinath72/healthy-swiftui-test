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
    func Get(Compilition:@escaping([String]) -> ()){
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
                let responseString = try? JSON(data!)
                let count = responseString!.count - 1
                var arrayNames:[String] = []
                for i in 0...count{
                    arrayNames.append(responseString![i]["name"]["common"].description)
                }
                DispatchQueue.main.async {
                    Compilition(arrayNames)
                }
            }
            else {
                // Failure
                
            }
        }
        task.resume()
        session.finishTasksAndInvalidate()
    }
    func getDetails(name:String,Compilition:@escaping(String,String,String,String,String,String,String,String) -> ()){
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        guard let URLL = URL(string: "https://restcountries.com/v3.1//name/\(name.lowercased())") else { return}
        let request = NSMutableURLRequest(url: URLL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = session.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                let responseString = try? JSON(data!)
                print(responseString)
                var NameOfficial:String = ""
                var IMG:String = ""
                var IDD:String = ""
                var Capital:String = ""
                var Region:String = ""
                var Subregion:String = ""
                var CarSide:String = ""
                var TimeZone:String = ""
                NameOfficial = responseString![0]["name"]["official"].description
                IMG = responseString![0]["flags"]["png"].description
                IDD = responseString![0]["idd"]["root"].description + responseString![0]["idd"]["suffixes"][0].description
                Capital = responseString![0]["capital"][0].description
                Region = responseString![0]["region"].description
                Subregion = responseString![0]["subregion"].description
                CarSide = responseString![0]["car"]["side"].description
                TimeZone = responseString![0]["timezones"][0].description
                print(TimeZone)
                DispatchQueue.main.async {
                    Compilition(NameOfficial,IMG,IDD,Capital,Region,Subregion,CarSide,TimeZone)
                }
            }
            else {
                // Failure
                
            }
        }
        task.resume()
        session.finishTasksAndInvalidate()
    }
}
