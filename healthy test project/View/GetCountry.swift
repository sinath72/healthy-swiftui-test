//
//  GetCountry.swift
//  healthy test project
//
//  Created by sina taherkhani on 2/28/23.
//

import Foundation
import SwiftUI
protocol CountryProtocol:View{
    func getData(data:[CountryInfo])
    func errors(eroor:Error)
}
protocol CountryDetailsProtocol:View{
    func getData(data:CountryInfo)
    func errors(eroor:Error)
}
enum GetMode{
    case minimal
    case full
}
class Country{
    var simpleCountryDelegate:(any CountryProtocol)?
    var fullCountryDetailsDelegates:(any CountryDetailsProtocol)?
    var NameArray:[String] = []
    private func setUrl(_ type:GetMode,_ name:String = "") -> URL?{
        switch type {
        case .minimal:
            guard let URLL = URL(string: "https://restcountries.com/v3.1/all") else { return nil}
            return URLL
        case .full:
            if name != ""{
                guard let URLL = URL(string: "https://restcountries.com/v3.1//name/\(name.lowercased())") else { return nil}
                return URLL
            }
            else{
                return nil
            }
        }
    }
    private func setRequest(_ url:URL) -> NSMutableURLRequest{
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
    private func getSession() -> URLSession{
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        return session
    }
    func Get(){
        let session = getSession()
        let URLL = setUrl(.minimal)
        if let URLL = URLL{
            let request = setRequest(URLL)
            session.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
                if (error == nil) {
                    // Success
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    let responseString = try? JSONDecoder().decode([CountryInfo].self, from: data!)
                    self.simpleCountryDelegate?.getData(data: responseString!)
                }
                else {
                    // Failure
                    self.simpleCountryDelegate?.errors(eroor: error!)
                }
            }.resume()
            session.finishTasksAndInvalidate()
        }
        else{
            print("Somthing Wrong")
        }
    }
    func getDetails(name:String){
        let session = getSession()
        let URLL = setUrl(.full,name)
        if let URLL = URLL{
            let request = setRequest(URLL)
            session.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
                if (error == nil) {
                    // Success
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    print("URL Session Task Succeeded: HTTP \(statusCode)")
                    let responseString = try? JSONDecoder().decode([CountryInfo].self, from: data!)
                    let count = responseString!.count - 1
                    var id = 0
                    for i in 0...count{
                        if responseString![i].name.common == name{
                            id = i
                            break
                        }
                    }
                    let myData = responseString![id]
                    self.fullCountryDetailsDelegates?.getData(data: myData)
                }
                else {
                    // Failure
                    self.fullCountryDetailsDelegates?.errors(eroor: error!)
                }
            }.resume()
            session.finishTasksAndInvalidate()
        }
        else{
            print("Somthing is bad")
        }
    }
}
