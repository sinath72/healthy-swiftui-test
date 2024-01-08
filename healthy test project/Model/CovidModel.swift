// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let covidModel = try? JSONDecoder().decode(CovidModel.self, from: jsonData)

import Foundation

// MARK: - CovidModelElement
struct CovidModelElement: Codable {
    let infected: Int?
    let tested, recovered, deceased: DeceasedUnion
    let country: String
    let moreData, historyData: String
    let sourceURL: String?
    let lastUpdatedApify: String
    let lastUpdatedSource: String?

    enum CodingKeys: String, CodingKey {
        case infected, tested, recovered, deceased, country, moreData, historyData
        case sourceURL
        case lastUpdatedApify, lastUpdatedSource
    }
}

enum DeceasedUnion: Codable {
    case enumeration(DeceasedEnum)
    case integer(Int)
    case null

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(DeceasedEnum.self) {
            self = .enumeration(x)
            return
        }
        if container.decodeNil() {
            self = .null
            return
        }
        throw DecodingError.typeMismatch(DeceasedUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for DeceasedUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .enumeration(let x):
            try container.encode(x)
        case .integer(let x):
            try container.encode(x)
        case .null:
            try container.encodeNil()
        }
    }
}

enum DeceasedEnum: String, Codable {
    case na = "NA"
}

typealias CovidModel = [CovidModelElement]
