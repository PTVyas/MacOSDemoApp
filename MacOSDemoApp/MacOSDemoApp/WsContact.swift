//
//  WsContact.swift
//
//  Created by wos on 25/11/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class WsContact: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let internationalCallingCode = "international_calling_code"
    static let hasOurApp = "hasOurApp"
    static let isMobile = "is_mobile"
    static let localNumber = "local_number"
    static let internationalNumber = "international_number"
    static let gmtZone = "gmt_zone"
    static let iD = "ID"
    static let location = "location"
    static let imagebase64 = "imagebase64"
    static let countryCode = "country_code"
    static let isLineShared = "isLineShared"
    static let isCallFree = "isCallFree"
    static let valid = "valid"
    static let caption = "caption"
  }

  // MARK: Properties
  public var internationalCallingCode: String?
  public var hasOurApp: Bool? = false
  public var isMobile: Bool? = false
  public var localNumber: String?
  public var internationalNumber: String?
  public var gmtZone: String?
  public var iD: Int?
  public var location: String?
  public var imagebase64: String?
  public var countryCode: String?
  public var isLineShared: Bool? = false
  public var isCallFree: Bool? = false
  public var valid: Bool? = false
  public var caption: String?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    internationalCallingCode = json[SerializationKeys.internationalCallingCode].string
    hasOurApp = json[SerializationKeys.hasOurApp].boolValue
    isMobile = json[SerializationKeys.isMobile].boolValue
    localNumber = json[SerializationKeys.localNumber].string
    internationalNumber = json[SerializationKeys.internationalNumber].string
    gmtZone = json[SerializationKeys.gmtZone].string
    iD = json[SerializationKeys.iD].int
    location = json[SerializationKeys.location].string
    imagebase64 = json[SerializationKeys.imagebase64].string
    countryCode = json[SerializationKeys.countryCode].string
    isLineShared = json[SerializationKeys.isLineShared].boolValue
    isCallFree = json[SerializationKeys.isCallFree].boolValue
    valid = json[SerializationKeys.valid].boolValue
    caption = json[SerializationKeys.caption].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = internationalCallingCode { dictionary[SerializationKeys.internationalCallingCode] = value }
    dictionary[SerializationKeys.hasOurApp] = hasOurApp
    dictionary[SerializationKeys.isMobile] = isMobile
    if let value = localNumber { dictionary[SerializationKeys.localNumber] = value }
    if let value = internationalNumber { dictionary[SerializationKeys.internationalNumber] = value }
    if let value = gmtZone { dictionary[SerializationKeys.gmtZone] = value }
    if let value = iD { dictionary[SerializationKeys.iD] = value }
    if let value = location { dictionary[SerializationKeys.location] = value }
    if let value = imagebase64 { dictionary[SerializationKeys.imagebase64] = value }
    if let value = countryCode { dictionary[SerializationKeys.countryCode] = value }
    dictionary[SerializationKeys.isLineShared] = isLineShared
    dictionary[SerializationKeys.isCallFree] = isCallFree
    dictionary[SerializationKeys.valid] = valid
    if let value = caption { dictionary[SerializationKeys.caption] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.internationalCallingCode = aDecoder.decodeObject(forKey: SerializationKeys.internationalCallingCode) as? String
    self.hasOurApp = aDecoder.decodeBool(forKey: SerializationKeys.hasOurApp)
    self.isMobile = aDecoder.decodeBool(forKey: SerializationKeys.isMobile)
    self.localNumber = aDecoder.decodeObject(forKey: SerializationKeys.localNumber) as? String
    self.internationalNumber = aDecoder.decodeObject(forKey: SerializationKeys.internationalNumber) as? String
    self.gmtZone = aDecoder.decodeObject(forKey: SerializationKeys.gmtZone) as? String
    self.iD = aDecoder.decodeObject(forKey: SerializationKeys.iD) as? Int
    self.location = aDecoder.decodeObject(forKey: SerializationKeys.location) as? String
    self.imagebase64 = aDecoder.decodeObject(forKey: SerializationKeys.imagebase64) as? String
    self.countryCode = aDecoder.decodeObject(forKey: SerializationKeys.countryCode) as? String
    self.isLineShared = aDecoder.decodeBool(forKey: SerializationKeys.isLineShared)
    self.isCallFree = aDecoder.decodeBool(forKey: SerializationKeys.isCallFree)
    self.valid = aDecoder.decodeBool(forKey: SerializationKeys.valid)
    self.caption = aDecoder.decodeObject(forKey: SerializationKeys.caption) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(internationalCallingCode, forKey: SerializationKeys.internationalCallingCode)
    aCoder.encode(hasOurApp, forKey: SerializationKeys.hasOurApp)
    aCoder.encode(isMobile, forKey: SerializationKeys.isMobile)
    aCoder.encode(localNumber, forKey: SerializationKeys.localNumber)
    aCoder.encode(internationalNumber, forKey: SerializationKeys.internationalNumber)
    aCoder.encode(gmtZone, forKey: SerializationKeys.gmtZone)
    aCoder.encode(iD, forKey: SerializationKeys.iD)
    aCoder.encode(location, forKey: SerializationKeys.location)
    aCoder.encode(imagebase64, forKey: SerializationKeys.imagebase64)
    aCoder.encode(countryCode, forKey: SerializationKeys.countryCode)
    aCoder.encode(isLineShared, forKey: SerializationKeys.isLineShared)
    aCoder.encode(isCallFree, forKey: SerializationKeys.isCallFree)
    aCoder.encode(valid, forKey: SerializationKeys.valid)
    aCoder.encode(caption, forKey: SerializationKeys.caption)
  }

}
