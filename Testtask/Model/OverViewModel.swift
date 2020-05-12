//
//  OverViewModel.swift
//  Testtask
//
//  Created by Tanvi Bhatia on 12/05/20.
//  Copyright © 2020 Tanvi Bhatia. All rights reserved.
//



import Foundation

// MARK: - Welcome
struct OverViewModel: Codable {
    let error: Bool?
    let errorCode: Int?
    let message: String?
    let data: EventDataClass?

    enum CodingKeys: String, CodingKey {
        case error
        case errorCode = "error_code"
        case message, data
    }
}

// MARK: - DataClass
struct EventDataClass: Codable {
    let eventID, evUserID, evEventType, evCategoryID: String?
    let evTagID, evVenueID, evEventFee, evIsPublic: String?
    let evFeatured, evName, evNameAr, evTitle: String?
    let evTitleAr, evOrganizerName, evOrganizerID, evStartDate: String?
    let evEndDate, evStartTime, evEndTime: String?
    let evImage: [EvImage]?
    let evSeatingMapImage: [JSONAny]?
    let evVennueName, evVennueNameAr, evCountry, evRegion: String?
    let evCity, evAddress, evLat, evLong: String?
    let evGender, evAgeID, evLanguage, evImpNotes: String?
    let evImpNotesAr, evDescription, evDescriptionAr, evDetail: String?
    let evDetailAr, evEmail, evContact, evWhatsappNo: String?
    let evWebsite: String?
    let evViews, evLike, evStatus, evIsPromoted: String?
    let evPromoteCountry, evPromoteCity, evPromotedPoints, evCreatedAt: String?
    let evIsFav, categoryName, categoryColor: String?
    let eventTag: [EventTag]?
    let evUsersPoints, evCountryID, evCityID, evRegionID: String?
    let evCountryPoints, evRegionPoints, evCityPoints, evEventTypeName: String?
    let evReminder, evIsReminder, evNew, distance: String?
    let eventOrganizer: [EventOrganizer]?
    let eventSponser: [EventSponser]?
    let eventPerformer: [EventPerformer]?
    let commentCount: String?
    let comment: [Comment]?
    let viewPromotePoints, durationPromotePoints: [PromotePoint]?

    enum CodingKeys: String, CodingKey {
        case eventID = "event_id"
        case evUserID = "ev_user_id"
        case evEventType = "ev_event_type"
        case evCategoryID = "ev_category_id"
        case evTagID = "ev_tag_id"
        case evVenueID = "ev_venue_id"
        case evEventFee = "ev_event_fee"
        case evIsPublic = "ev_is_public"
        case evFeatured = "ev_featured"
        case evName = "ev_name"
        case evNameAr = "ev_name_ar"
        case evTitle = "ev_title"
        case evTitleAr = "ev_title_ar"
        case evOrganizerName = "ev_organizer_name"
        case evOrganizerID = "ev_organizer_id"
        case evStartDate = "ev_start_date"
        case evEndDate = "ev_end_date"
        case evStartTime = "ev_start_time"
        case evEndTime = "ev_end_time"
        case evImage = "ev_image"
        case evSeatingMapImage = "ev_seating_map_image"
        case evVennueName = "ev_vennue_name"
        case evVennueNameAr = "ev_vennue_name_ar"
        case evCountry = "ev_country"
        case evRegion = "ev_region"
        case evCity = "ev_city"
        case evAddress = "ev_address"
        case evLat = "ev_lat"
        case evLong = "ev_long"
        case evGender = "ev_gender"
        case evAgeID = "ev_age_id"
        case evLanguage = "ev_language"
        case evImpNotes = "ev_imp_notes"
        case evImpNotesAr = "ev_imp_notes_ar"
        case evDescription = "ev_description"
        case evDescriptionAr = "ev_description_ar"
        case evDetail = "ev_detail"
        case evDetailAr = "ev_detail_ar"
        case evEmail = "ev_email"
        case evContact = "ev_contact"
        case evWhatsappNo = "ev_whatsapp_no"
        case evWebsite = "ev_website"
        case evViews = "ev_views"
        case evLike = "ev_like"
        case evStatus = "ev_status"
        case evIsPromoted = "ev_is_promoted"
        case evPromoteCountry = "ev_promote_country"
        case evPromoteCity = "ev_promote_city"
        case evPromotedPoints = "ev_promoted_points"
        case evCreatedAt = "ev_created_at"
        case evIsFav = "ev_is_fav"
        case categoryName = "category_name"
        case categoryColor = "category_color"
        case eventTag = "event_tag"
        case evUsersPoints = "ev_users_points"
        case evCountryID = "ev_country_id"
        case evCityID = "ev_city_id"
        case evRegionID = "ev_region_id"
        case evCountryPoints = "ev_country_points"
        case evRegionPoints = "ev_region_points"
        case evCityPoints = "ev_city_points"
        case evEventTypeName = "ev_event_type_name"
        case evReminder = "ev_reminder"
        case evIsReminder = "ev_is_reminder"
        case evNew = "ev_new"
        case distance
        case eventOrganizer = "event_organizer"
        case eventSponser = "event_sponser"
        case eventPerformer = "event_performer"
        case commentCount, comment
        case viewPromotePoints = "view_promote_points"
        case durationPromotePoints = "duration_promote_points"
    }
}

// MARK: - Comment
struct Comment: Codable {
    let commentID, ecEventID, ecUserID, ecComment: String?
    let ecStatus, ecCreatedAt, uName: String?
    let uImage: String?

    enum CodingKeys: String, CodingKey {
        case commentID = "comment_id"
        case ecEventID = "ec_event_id"
        case ecUserID = "ec_user_id"
        case ecComment = "ec_comment"
        case ecStatus = "ec_status"
        case ecCreatedAt = "ec_created_at"
        case uName = "u_name"
        case uImage = "u_image"
    }
}

// MARK: - PromotePoint
struct PromotePoint: Codable {
    let id, views, points, type: String?
    let durationStatus: String?

    enum CodingKeys: String, CodingKey {
        case id, views, points, type
        case durationStatus = "duration_status"
    }
}

// MARK: - EvImage
struct EvImage: Codable {
    let image: String?
}

// MARK: - EventOrganizer
struct EventOrganizer: Codable {
    let organizerID, oName, oNameAr: String?
    let oLogo: String?
    let oDetail, oDetailAr, oContact, oEmail: String?
    let oWebsite: String?
    let oImage, oStatus, oCreatedAt, eventOrganizerID: String?

    enum CodingKeys: String, CodingKey {
        case organizerID = "organizer_id"
        case oName = "o_name"
        case oNameAr = "o_name_ar"
        case oLogo = "o_logo"
        case oDetail = "o_detail"
        case oDetailAr = "o_detail_ar"
        case oContact = "o_contact"
        case oEmail = "o_email"
        case oWebsite = "o_website"
        case oImage = "o_image"
        case oStatus = "o_status"
        case oCreatedAt = "o_created_at"
        case eventOrganizerID = "event_organizer_id"
    }
}

// MARK: - EventPerformer
struct EventPerformer: Codable {
    let performerID, pName, pNameAr: String?
    let pLogo: String?
    let pDetail, pDetailAr, pType, pContact: String?
    let pEmail, pWebsite, pImage, pStatus: String?
    let pCreatedAt, eventOrganizerID: String?

    enum CodingKeys: String, CodingKey {
        case performerID = "performer_id"
        case pName = "p_name"
        case pNameAr = "p_name_ar"
        case pLogo = "p_logo"
        case pDetail = "p_detail"
        case pDetailAr = "p_detail_ar"
        case pType = "p_type"
        case pContact = "p_contact"
        case pEmail = "p_email"
        case pWebsite = "p_website"
        case pImage = "p_image"
        case pStatus = "p_status"
        case pCreatedAt = "p_created_at"
        case eventOrganizerID = "event_organizer_id"
    }
}

// MARK: - EventSponser
struct EventSponser: Codable {
    let sponsorID, sName, sNameAr: String?
    let sLogo: String?
    let sDetail, sDetailAr, sContact, sType: String?
    let sEmail: String?
    let sWebsite: String?
    let sImage, sStatus, sCreatedAt, eventOrganizerID: String?

    enum CodingKeys: String, CodingKey {
        case sponsorID = "sponsor_id"
        case sName = "s_name"
        case sNameAr = "s_name_ar"
        case sLogo = "s_logo"
        case sDetail = "s_detail"
        case sDetailAr = "s_detail_ar"
        case sContact = "s_contact"
        case sType = "s_type"
        case sEmail = "s_email"
        case sWebsite = "s_website"
        case sImage = "s_image"
        case sStatus = "s_status"
        case sCreatedAt = "s_created_at"
        case eventOrganizerID = "event_organizer_id"
    }
}

// MARK: - EventTag
struct EventTag: Codable {
    let etID, etNameEn, etColor: String?

    enum CodingKeys: String, CodingKey {
        case etID = "et_id"
        case etNameEn = "et_name_en"
        case etColor = "et_color"
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

