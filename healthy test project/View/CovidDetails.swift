//
//  CovidDetails.swift
//  healthy test project
//
//  Created by Macvps on 3/4/23.
//

import Foundation
import SwiftUI
protocol CovidCountryProtocol:View{
    func getData(_ data:[CovidModelElement])
    func getErrors(_ error:Error)
}
protocol CovidCountryDetailsProtocol:View{
    func getData(_ data:CovidDetailsModel?)
    func getErrors(_ error:Error)
}
struct CovidDetails{
    private var api_token = "apify_api_fIOI7pGEMFeCg84XDPhwtdPBG2cfbJ4z3PYo"
    var countryListDelegate:(any CovidCountryProtocol)?
    var countryDetailsDelegate:(any CovidCountryDetailsProtocol)?
    private func setUrl(_ type:GetMode,_ name:String = "") -> URL?{
        switch type {
        case .minimal:
            guard let URLL = URL(string: "https://api.apify.com/v2/key-value-stores/tVaYRsPHLjNdNBu7S/records/LATEST?disableRedirect=true") else { return nil}
            return URLL
        case .full:
            if name != ""{
                guard let URLL = URL(string: name) else { return nil}
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
    func getCountryList(){
        let session = getSession()
        let URLL = setUrl(.minimal)
        if let URLL = URLL{
            let request = setRequest(URLL)
            session.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
                if (error == nil) {
                    // Success
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    let responseString = try? JSONDecoder().decode([CovidModelElement].self, from: data!)
                    self.countryListDelegate?.getData(responseString!)
                }
                else {
                    // Failure
                    self.countryListDelegate?.getErrors(error!)
                }
            }.resume()
            session.finishTasksAndInvalidate()
        }
        else{
            print("Wrong")
        }
    }
    func getCountryCovidDetails(url:String){
        let session = getSession()
        let URLL = setUrl(.full,url)
        if let URLL = URLL {
            let request = setRequest(URLL)
            session.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
                if (error == nil) {
                    // Success
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    let responseData = try? JSONDecoder().decode(CovidDetailsModel.self, from: data!)
                    self.countryDetailsDelegate?.getData(responseData)
                }
                else {
                    // Failure
                    
                }
            }.resume()
            session.finishTasksAndInvalidate()
        }
    }
}
