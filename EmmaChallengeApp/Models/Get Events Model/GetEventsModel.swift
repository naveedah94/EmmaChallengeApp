// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let getEventsModel = try? newJSONDecoder().decode(GetEventsModel.self, from: jsonData)

import Foundation

// MARK: - GetEventsModel
struct GetEventsModel: Codable {
    let embedded: GetEventsModelEmbedded?
    let links: GetEventsModelLinks?
    let page: Page?

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
        case links = "_links"
        case page
    }
}

// MARK: - GetEventsModelEmbedded
struct GetEventsModelEmbedded: Codable {
    let events: [Event]?
}

// MARK: - Event
struct Event: Codable {
    let name, type, id: String?
    let test: Bool?
    let url: String?
    let locale: String?
    let images: [Image]?
    let sales: Sales?
    let dates: Dates?
    let classifications: [Classification]?
    let promoter: Promoter?
    let promoters: [Promoter]?
    let accessibility: Accessibility?
    let ticketLimit: TicketLimit?
    let ageRestrictions: AgeRestrictions?
    let links: EventLinks?
    let embedded: EventEmbedded?
    var isFavourite: Bool = false

    enum CodingKeys: String, CodingKey {
        case name, type, id, test, url, locale, images, sales, dates, classifications, promoter, promoters, accessibility, ticketLimit, ageRestrictions
        case links = "_links"
        case embedded = "_embedded"
    }
}

// MARK: - Accessibility
struct Accessibility: Codable {
}

// MARK: - AgeRestrictions
struct AgeRestrictions: Codable {
    let legalAgeEnforced: Bool?
}

// MARK: - Classification
struct Classification: Codable {
    let primary: Bool?
    let segment, genre, subGenre, type: Genre?
    let subType: Genre?
    let family: Bool?
}

// MARK: - Genre
struct Genre: Codable {
    let id, name: String?
}

// MARK: - Dates
struct Dates: Codable {
    let start: Start?
    let timezone: String?
    let status: Status?
    let spanMultipleDays: Bool?
}

// MARK: - Start
struct Start: Codable {
    let localDate, localTime: String?
    let dateTime: String?
    let dateTBD, dateTBA, timeTBA, noSpecificTime: Bool?
}

// MARK: - Status
struct Status: Codable {
    let code: String?
}

// MARK: - EventEmbedded
struct EventEmbedded: Codable {
    let venues: [Venue]?
    let attractions: [Attraction]?
}

// MARK: - Attraction
struct Attraction: Codable {
    let name, type, id: String?
    let test: Bool?
    let url: String?
    let locale: String?
    let externalLinks: ExternalLinks?
    let images: [Image]?
    let classifications: [Classification]?
    let upcomingEvents: UpcomingEvents?
    let links: AttractionLinks?

    enum CodingKeys: String, CodingKey {
        case name, type, id, test, url, locale, externalLinks, images, classifications, upcomingEvents
        case links = "_links"
    }
}

// MARK: - ExternalLinks
struct ExternalLinks: Codable {
    let twitter, facebook, wiki, instagram: [Facebook]?
    let homepage: [Facebook]?
}

// MARK: - Facebook
struct Facebook: Codable {
    let url: String?
}

// MARK: - Image
struct Image: Codable {
    let ratio: String?
    let url: String?
    let width, height: Int?
    let fallback: Bool?
}

// MARK: - AttractionLinks
struct AttractionLinks: Codable {
    let linksSelf: First?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - First
struct First: Codable {
    let href: String?
}

// MARK: - UpcomingEvents
struct UpcomingEvents: Codable {
    let total, ticketmaster: Int?

    enum CodingKeys: String, CodingKey {
        case total = "_total"
        case ticketmaster
    }
}

// MARK: - Venue
struct Venue: Codable {
    let name, type, id: String?
    let test: Bool?
    let url: String?
    let locale: String?
    let aliases: [String]?
    let images: [Image]?
    let postalCode, timezone: String?
    let city: City?
    let state: State?
    let country: Country?
    let address: Address?
    let location: Location?
    let markets: [Genre]?
    let dmas: [DMA]?
    let boxOfficeInfo: BoxOfficeInfo?
    let parkingDetail: String?
    let accessibleSeatingDetail: String?
    let generalInfo: GeneralInfo?
    let upcomingEvents: UpcomingEvents?
    let links: AttractionLinks?

    enum CodingKeys: String, CodingKey {
        case name, type, id, test, url, locale, aliases, images, postalCode, timezone, city, state, country, address, location, markets, dmas, boxOfficeInfo, parkingDetail, accessibleSeatingDetail, generalInfo, upcomingEvents
        case links = "_links"
    }
}

// MARK: - Address
struct Address: Codable {
    let line1: String?
}

// MARK: - BoxOfficeInfo
struct BoxOfficeInfo: Codable {
    let phoneNumberDetail, openHoursDetail, acceptedPaymentDetail, willCallDetail: String?
}

// MARK: - City
struct City: Codable {
    let name: String?
}

// MARK: - Country
struct Country: Codable {
    let name, countryCode: String?
}

// MARK: - DMA
struct DMA: Codable {
    let id: Int?
}

// MARK: - GeneralInfo
struct GeneralInfo: Codable {
    let generalRule, childRule: String?
}

// MARK: - Location
struct Location: Codable {
    let longitude, latitude: String?
}

// MARK: - State
struct State: Codable {
    let name, stateCode: String?
}

// MARK: - EventLinks
struct EventLinks: Codable {
    let linksSelf: First?
    let attractions, venues: [First]?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case attractions, venues
    }
}

// MARK: - Promoter
struct Promoter: Codable {
    let id, name, promoterDescription: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case promoterDescription = "description"
    }
}

// MARK: - Sales
struct Sales: Codable {
    let salesPublic: Public?
    let presales: [Presale]?

    enum CodingKeys: String, CodingKey {
        case salesPublic = "public"
        case presales
    }
}

// MARK: - Presale
struct Presale: Codable {
    let startDateTime, endDateTime: String?
    let name: String?
}

// MARK: - Public
struct Public: Codable {
    let startDateTime: String?
    let startTBD, startTBA: Bool?
    let endDateTime: String?
}

// MARK: - TicketLimit
struct TicketLimit: Codable {
    let info: String?
}

// MARK: - GetEventsModelLinks
struct GetEventsModelLinks: Codable {
    let first, prev, linksSelf, next: First?
    let last: First?

    enum CodingKeys: String, CodingKey {
        case first, prev
        case linksSelf = "self"
        case next, last
    }
}

// MARK: - Page
struct Page: Codable {
    let size, totalElements, totalPages, number: Int?
}
