//
//  ContryModel.swift
//  healthy test project
//
//  Created by Macvps on 1/7/24.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

// MARK: - WelcomeElement
struct CountryInfo: Codable {
    let name: Name
    let tld: [String]?
    let cca2: String
    let ccn3: String?
    let cca3: String
    let independent: Bool?
    let status: Status
    let unMember: Bool
    let currencies: Currencies?
    let idd: Idd
    let capital: [String]?
    let altSpellings: [String]
    let region: Region
    let subregion: String?
    let languages: [String: String]?
    let translations: [String: Translation]
    let latlng: [Double]
    let landlocked: Bool
    let area: Double
    let demonyms: Demonyms?
    let flag: String
    let maps: Maps
    let population: Int
    let car: Car
    let timezones: [String]
    let continents: [Continent]
    let flags: Flags
    let coatOfArms: CoatOfArms
    let startOfWeek: StartOfWeek
    let capitalInfo: CapitalInfo
    let postalCode: PostalCode?
    let cioc: String?
    let borders: [String]?
    let fifa: String?
    let gini: [String: Double]?
}

// MARK: - CapitalInfo
struct CapitalInfo: Codable {
    let latlng: [Double]?
}

// MARK: - Car
struct Car: Codable {
    let signs: [String]?
    let side: Side
}

enum Side: String, Codable {
    case sideLeft = "left"
    case sideRight = "right"
}

// MARK: - CoatOfArms
struct CoatOfArms: Codable {
    let png: String?
    let svg: String?
}

enum Continent: String, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
}

// MARK: - Currencies
struct Currencies: Codable {
    let aud, ern, wst, mkd: Aed?
    let djf, jod, pkr, xpf: Aed?
    let eur, mru, dkk, nad: Aed?
    let zar, ghs, ssp, usd: Aed?
    let mdl, kpw, mop, scr: Aed?
    let amd, ang, xaf, syp: Aed?
    let aoa, tjs, ves, pln: Aed?
    let sar: Aed?
    let bam: BAM?
    let czk, gtq, krw, npr: Aed?
    let bwp, php, iqd, lbp: Aed?
    let bif, mnt, fok, pyg: Aed?
    let nok, nzd, gbp, ggp: Aed?
    let dzd, pab, egp, ils: Aed?
    let yer, brl, ngn, jpy: Aed?
    let tzs, kzt, shp, lkr: Aed?
    let mad, mmk, cop, pen: Aed?
    let xof, kgs, cny, afn: Aed?
    let currenciesTRY, lrd, clp, kid: Aed?
    let cve, jep, isk, gmd: Aed?
    let vuv, uyu, omr: Aed?
    let sdg: BAM?
    let inr, lak, awg, kmf: Aed?
    let xcd, uzs, mvr, gip: Aed?
    let idr, vnd, myr, ckd: Aed?
    let szl, ugx, mga, fjd: Aed?
    let twd, pgk, rwf, cdf: Aed?
    let rsd, khr, aed, bmd: Aed?
    let cuc, cup, hkd, mur: Aed?
    let ars, nio, uah, gyd: Aed?
    let tvd, lsl, top, gel: Aed?
    let etb, dop, bzd, imp: Aed?
    let htg, bdt, kwd, jmd: Aed?
    let ron, stn, bsd, mxn: Aed?
    let tmt, srd, sek, bob: Aed?
    let mzn, mwk, all, zmw: Aed?
    let chf, qar, sbd, lyd: Aed?
    let bbd, hnl, sos, kyd: Aed?
    let kes, bhd, gnf, rub: Aed?
    let bnd, sgd, zwl, byn: Aed?
    let thb, tnd, sll, btn: Aed?
    let fkp, cad, ttd, huf: Aed?
    let crc, bgn, azn, irr: Aed?

    enum CodingKeys: String, CodingKey {
        case aud
        case ern
        case wst
        case mkd
        case djf
        case jod
        case pkr
        case xpf
        case eur
        case mru
        case dkk
        case nad
        case zar
        case ghs
        case ssp
        case usd
        case mdl
        case kpw
        case mop
        case scr
        case amd
        case ang
        case xaf
        case syp
        case aoa
        case tjs
        case ves
        case pln
        case sar
        case bam
        case czk
        case gtq
        case krw
        case npr
        case bwp
        case php
        case iqd
        case lbp
        case bif
        case mnt
        case fok
        case pyg
        case nok
        case nzd
        case gbp
        case ggp
        case dzd
        case pab
        case egp
        case ils
        case yer
        case brl
        case ngn
        case jpy
        case tzs
        case kzt
        case shp
        case lkr
        case mad
        case mmk
        case cop
        case pen
        case xof
        case kgs
        case cny
        case afn
        case currenciesTRY
        case lrd
        case clp
        case kid
        case cve
        case jep
        case isk
        case gmd
        case vuv
        case uyu
        case omr
        case sdg
        case inr
        case lak
        case awg
        case kmf
        case xcd
        case uzs
        case mvr
        case gip
        case idr
        case vnd
        case myr
        case ckd
        case szl
        case ugx
        case mga
        case fjd
        case twd
        case pgk
        case rwf
        case cdf
        case rsd
        case khr
        case aed
        case bmd
        case cuc
        case cup
        case hkd
        case mur
        case ars
        case nio
        case uah
        case gyd
        case tvd
        case lsl
        case top
        case gel
        case etb
        case dop
        case bzd
        case imp
        case htg
        case bdt
        case kwd
        case jmd
        case ron
        case stn
        case bsd
        case mxn
        case tmt
        case srd
        case sek
        case bob
        case mzn
        case mwk
        case all
        case zmw
        case chf
        case qar
        case sbd
        case lyd
        case bbd
        case hnl
        case sos
        case kyd
        case kes
        case bhd
        case gnf
        case rub
        case bnd
        case sgd
        case zwl
        case byn
        case thb
        case tnd
        case sll
        case btn
        case fkp
        case cad
        case ttd
        case huf
        case crc
        case bgn
        case azn
        case irr
    }
}

// MARK: - Aed
struct Aed: Codable {
    let name, symbol: String
}

// MARK: - BAM
struct BAM: Codable {
    let name: String
}

// MARK: - Demonyms
struct Demonyms: Codable {
    let eng: Eng
    let fra: Eng?
}

// MARK: - Eng
struct Eng: Codable {
    let f, m: String
}

// MARK: - Flags
struct Flags: Codable {
    let png: String
    let svg: String
    let alt: String?
}

// MARK: - Idd
struct Idd: Codable {
    let root: String?
    let suffixes: [String]?
}

// MARK: - Maps
struct Maps: Codable {
    let googleMaps, openStreetMaps: String
}

// MARK: - Name
struct Name: Codable {
    let common, official: String
    let nativeName: [String: Translation]?
}

// MARK: - Translation
struct Translation: Codable {
    let official, common: String
}

// MARK: - PostalCode
struct PostalCode: Codable {
    let format: String
    let regex: String?
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

enum StartOfWeek: String, Codable {
    case monday = "monday"
    case saturday = "saturday"
    case sunday = "sunday"
}

enum Status: String, Codable {
    case officiallyAssigned = "officially-assigned"
    case userAssigned = "user-assigned"
}

typealias Welcome = [CountryInfo]
