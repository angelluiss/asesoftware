//
//  Constants.swift
//  asesoftware
//
//  Created by Angel Rangel on 30/05/24.
//

import Foundation
import SwiftUI

struct Urls {
    static let apiProduction = "https://api.themoviedb.org/"
    static let imagePath = "t/p/w500"
    static let popularPath = "3/person/popular"
    static let tvPath = "3/tv/top_rated"
    static let authPath = "3/authentication"
    static let imageURL = "https://image.tmdb.org/"
    static let imageURLPath = "\(imageURL)\(imagePath)"
    static let popularList = "\(apiProduction)\(popularPath)"
    static let topRatedList = "\(apiProduction)\(tvPath)"
}

struct ApiKeys {
    static let apiProductionKey = "8f132c7724df3b43f3455d3e0975ad2f"
    static let apiProductionReadAccesToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4ZjEzMmM3NzI0ZGYzYjQzZjM0NTVkM2UwOTc1YWQyZiIsInN1YiI6IjY2NTgwMmFjNjg2MzVhN2ZiMTc0ZDdkMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.eOwtRy7a_viOL2RVJruk2kslbk8PlH5_jz1w7qnTGOk"
  
}

struct PostMethods {
    static let prefixAuthorization = "Basic "
    static let postNameAuth = "Authorization"
    static let prefixEdit = "Bearer "
}


struct Messages {
    static let noElements = "There is no elements."
    static let popularTittle = "Popular"
    static let topRatepTittle = "TopRated"
}

struct ConstantColors {
    
    static let grayOpacity = Color(UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 0.5))
    static let white = Color(UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1))
    static let gray = Color(red: 55/255, green: 55/255, blue: 55/255)
    static let red = Color(red: 0.882, green: 0.145, blue: 0.106)
    static let alertOpacity = 0.65
    static let blackOpacity = Color(red: 0.739, green: 0.739, blue: 0.739)
    static let black = Color(red: 0.286, green: 0.286, blue: 0.286)
    static let redAccent = Color(red: 0.882, green: 0.145, blue: 0.106)
    static let blackHome = Color(UIColor(red: 0.105, green: 0.105, blue: 0.105, alpha: 1))
    
}

struct figures {
    
    static let rectangleFill = "rectangle.fill"
    static let cornerRadiusSubMin: CGFloat = 3
    static let cornerRadiusMin: CGFloat = 10
    static let cornerRadiusMinMid: CGFloat = 16
    static let cornerRadiusMidium : CGFloat = 20
    static let cornerRadiusMax : CGFloat = 30
    static let cornerRadiusBig : CGFloat = 50
    static let arrowButtonDown = "chevron.down"
    static let arrowButtonUp = "chevron.up"
    static let arrowButtonRight = "chevron.right"
    static let trash = "trash"
}

struct ConstansUtils {
    
    static let zero = 0
    static let one = 1
    static let two = 2
    static let three = 3
    static let four = 4
    static let five = 5
    static let six = 6
    static let seven = 7
    static let eight = 8
    static let nine = 9
    static let ten = 10
    static let twentySeven = 27
    static let twenty = 20
    static let thirty = 30
    static let forty = 40
    static let twentyOne = 21
    static let eleven = 11
    static let fifty = 50
    static let timeoutOne: Double = 1
    static let timeoutFive: Double = 5
    static let timeoutTen: Double = 10
    static let timeoutTwentyFive: Double = 25.0
    static let timeoutSeventyFive: Double = 75
    static let emptyString = ""
    static let spacing = " "
    static let randomLetter: Character = "a"
    static let httpPath = "https://"
    static let suspensoryPoints = "..."
    static let rangeLoadListCollectionLinks = 0..<10
    static let statusCancel = "Cancel"
    static let statusWait = "Wait"
    static let statusOk = "Ok"
    static let moneyValue = "$"
    static let point = "."
    static let comma = ","
    static let defaultValueMoney = "0.00"
    static let dateFormatSeconds = "yyyy-MM-dd HH:mm:ss"
    static let dateFormatSecondsZ = "yyyy-MM-dd HH:mm:ss Z"
    static let dateFormatAmPm = "dd/MM/yyyy  hh:mm a"
    static let dateFormatDMY = "dd/MM/yyyy"
    static let dateFormatHourAmPm = "hh:mm a"
    static let timeAm = "a.m."
    static let timePm = "p.m."
    static let screenSizeMin = CGFloat(700)
    static let zeroValueMoney = "$0.00"
    static let maxValueAllowed: Decimal = 999_999_999_999_999_999_999_999.99
    static let zeroString: Character = "0"
    static let nineString: Character = "9"
    static let stringBodyFilter = "filter"
    static let stringBodyID = "id"
    static let stringName =  "Name"
    static let stringOName = "Original name"
    static let stringLanguage = "Language"
    static let stringGender = "Gender"
    static let stringBodyQuantity = "quantity"
    static let stringBodyAmount = "amount"
    static let stringBodyCurrency = "currency"
    static let stringBodyDescription = "description"
    static let stringBodyTittle = "title"
    static let stringBodyTypeSell = "typeSell"
    static let stringBodyTax = "tax"
    static let stringBodyReference = "reference"
    static let stringBodyIcoTax = "icoTax"
    static let stringBodyExpirationDate = "expirationDate"
    static let stringBodyImg = "img"
    static let stringBodyUrlConfirmation = "urlConfirmation"
    static let stringBodyUrlResponse = "urlResponse"
    static let midnightAmPm = "12:00 p.m."
    static let hourAmPm = "hh:mm a"
    static let https = "https://"
    static let dataBase64Img = "data:image/png;base64,"
    static let unauthotized = "Unauthorized."
    static let responseError = "Error"
    static let mail = "mail"
    static let credential = "password"
    static let credentialRepeat = "passwordRepeat"
    static let token = "token"
    static let validateEmail = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
    static let characterSpecial = "!@#$%^&*()-_=+[]{}|:<>.,;\"'\\/"
    
}

enum FocusedField {
    case searchText
}

enum FilterType {
    case adult
    case original_language
    case vote_average
}

enum OriginalLanguage: String, Codable, CaseIterable, Identifiable {
    case en = "en"
    case fr = "fr"
    case ja = "ja"
    case ko = "ko"
    
    var id: String { self.rawValue }
    
    var displayName: String {
        switch self {
        case .en: return "English"
        case .fr: return "French"
        case .ja: return "Japanese"
        case .ko: return "Korean"
        }
    }
}
