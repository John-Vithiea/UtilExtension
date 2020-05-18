//
//  StringExtension.swift
//  SwiftExtensionUtilities
//
//  Created by Vithiea-MacPro on 5/8/20.
//  Copyright © 2020 John-Vithiea. All rights reserved.
//

import Foundation

extension String {
    
    /// Converts a string to integer value.
    /// - Returns: An integer value of the string or return 0 if the string isn't valid integer number.
    public func toInt() -> Int {
        return Int(self) ?? 0
    }
    
    /// Converts a string to float value
    /// - Returns: A floating point number of the string or return 0.0 if the string isn't valid floating point number.
    public func toFloat() -> Float {
        return (self as NSString).floatValue
    }
    
    /// A boolean value to indicates whether all of characters in the string are whitespace.
    ///
    /// The property ".isEmpty" return false when the string contains whitespaces. Use property ".isBlank" instead to check for string either empty or blank.
    public var isBlank: Bool {
        return allSatisfy({$0.isWhitespace})
    }
    
    /// Finds and gets a character from string at a given index.
    /// - Parameter atIndex: Index to get a charater. Index counts from left to right.
    /// - Returns: A character at specified index of string or returns an empty string if the given index is out of bound.
    public func char(atIndex: Int) -> Character {
        if self.count >= atIndex {
            return self[self.index(startIndex, offsetBy: atIndex)]
        }
        return Character("")
    }
    
    /// Finds and gets a position of string or a character in rage of string
    /// - Parameter string: A string or a character to finds for its position.
    /// - Returns: An integer value of the first occurence of a given string or character's position.
    public func index(of string:String) -> Int {
        guard let range: Range<String.Index> = self.range(of: string) else{
            return 0
        }
        return self.distance(from: self.startIndex, to: range.lowerBound)
    }
    
    
    // MARK: Date
    
    /// Converts string of date to date format.
    /// - Parameters:
    ///   - format: The format of date to be converted. The default format is "yyyy-MM-dd".
    ///   - locale: The locale of time for the receiver. The default locale is "en_US".
    /// - Returns: A formated date with given formating string or nil.
    public func toDate(format:String = "yyyy-MM-dd", locale:String = "en_US") -> Date? {
        //        let isoDate = "2016-04-14"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: locale)
        dateFormatter.timeZone = TimeZone(secondsFromGMT:0)
        return dateFormatter.date(from:self)
    }
    
    /// Reformats string of date to new format.
    /// - Parameters:
    ///   - oldFormat: The format of current date of string
    ///   - newFormat: The format to be converted to.
    /// - Returns: A string of date with reformated date or empty string.
    public func reformatDate(oldFormat:String = "yyyy-MM-dd", newFormat:String) -> String {
        if let newDate = self.toDate(format: oldFormat) {
            return newDate.toString(format: newFormat)
        }
        return ""
    }
    
    /// Extracts only numbers from a string
    /// - Returns: A string containts only numbers.
    public func numberOnly() -> String {
        return self.components(separatedBy: NSCharacterSet.decimalDigits.inverted).joined(separator: "")
    }
}


/*
   public func encrypt() -> String {
       return self.encrypt(key:KEY.map{"\(Character(UnicodeScalar($0)))"}.reduce("",+))
   }
   
   public func decrypt() -> String {
       return self.decrypt(key:KEY.map{"\(Character(UnicodeScalar($0)))"}.reduce("",+))
   }
   
   var htmlToAttributedString: NSAttributedString? {
       guard let data = data(using: .utf8) else { return NSAttributedString() }
       do {
           return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
       } catch {
           return NSAttributedString()
       }
   }
   
   var htmlToString: String {
       return htmlToAttributedString?.string ?? ""
   }
*/
