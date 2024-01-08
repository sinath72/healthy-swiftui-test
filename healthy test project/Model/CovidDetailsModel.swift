// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let covidDetailsModel = try? JSONDecoder().decode(CovidDetailsModel.self, from: jsonData)

import Foundation

// MARK: - CovidDetailsModel
struct CovidDetailsModel: Codable {
    let infected, deceased, recovered, hospitalised, ICU, activeCases: Int?
    let tested, critical: Int?
    let sourceURL: String?
    let lastUpdatedAtApify: String?
    let readMe: String?
    let error: myError?

    enum CodingKeys: String, CodingKey {
        case infected, deceased, recovered, hospitalised, ICU, activeCases, tested, critical
        case sourceURL
        case lastUpdatedAtApify, readMe
        case error
    }
}
struct myError: Codable {
    let message, type: String
}
