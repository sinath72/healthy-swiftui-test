//
//  CovidDetails.swift
//  healthy test project
//
//  Created by Macvps on 3/4/23.
//

import Foundation
import SwiftyJSON
struct CovidDetails{
    private var api_token = "apify_api_fIOI7pGEMFeCg84XDPhwtdPBG2cfbJ4z3PYo"
    func getCountryList(Compilition:@escaping([String],[String]) -> ()){
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        guard let URLL = URL(string: "https://api.apify.com/v2/key-value-stores/tVaYRsPHLjNdNBu7S/records/LATEST?disableRedirect=true") else { return}
        let request = NSMutableURLRequest(url: URLL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = session.dataTask(with: request as URLRequest) { (data: Data?, response: URLResponse?, error: Error?) in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                let responseString = try? JSON(data!)
                let count = responseString!.count
                var arrayNames:[String] = []
                var arrayDataURL:[String] = []
                for i in 0...count{
                    arrayNames.append(responseString![i]["country"].description)
                    arrayDataURL.append(responseString![i]["moreData"].description)
                }
                DispatchQueue.main.async {
                    Compilition(arrayNames,arrayDataURL)
                }
            }
            else {
                // Failure
                
            }
        }
        task.resume()
        session.finishTasksAndInvalidate()
    }
    func getCountryCovidDetails(cname:String){
        
    }
}
