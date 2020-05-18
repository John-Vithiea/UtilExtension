//
//  DateExtension.swift
//  SwiftExtensionUtilities
//
//  Created by Vithiea-MacPro on 5/8/20.
//  Copyright © 2020 John-Vithiea. All rights reserved.
//

import Foundation

extension Date {
    
    /// Converts a date to string with given format.
    /// - Parameters:
    ///   - format: The string format of date to be converted. The default format is "yyyy-MM-dd"
    ///   - locale: The locale of time for the receiver. The default locale is "en_US".
    /// - Returns: A formated string date with given formating string or nil.
    public func toString(format:String = "yyyy-MM-dd", locale:String = "en_US") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: locale)
        dateFormatter.timeZone = TimeZone(secondsFromGMT:0)
        return dateFormatter.string(from: self)
    }
    
    /// Returns a boolean value that indicates whether a date is between two given dates.
    /// - Parameters:
    ///   - beginDate: The starting date to be compare.
    ///   - endDate: The ending date to be compare.
    /// - Returns: True if the date is between that the two given dates.
    public func isBetweenDate(_ beginDate:Date?, andDate endDate:Date?) -> Bool{
        // avoid crash on null
        guard let startDate = beginDate else { return false }
        guard let finishDate = endDate else { return false }
        
        return startDate.compare(self) == self.compare(finishDate)
    }
    
    /// Strips the time and get only date.
    /// - Parameter format: The format of current date to be stripped.
    /// - Returns: A date without time.
    public func stripTime(format:String = "yyyy-MM-dd") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        // optional
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        return dateFormatter.date(from: dateFormatter.string(from: self))!
    }
}
