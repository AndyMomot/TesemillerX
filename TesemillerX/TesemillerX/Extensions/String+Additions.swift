//
//  String+Additions.swift
//  Maximidriveup
//
//  Created by Andrii Momot on 23.04.2024.
//

import Foundation

extension String {
    func toDateWith(format: Date.Format) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.date(from: self)
    }
    
    func numberFormat() -> String {
        if let integer = Int(self) {
            let number = NSNumber(integerLiteral: integer)
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.groupingSeparator = " " // Use a space as the grouping separator
            formatter.groupingSize = 3

            // Format the number
            if let formattedNumber = formatter.string(from: number) {
                return formattedNumber
            }
        }
        
        return self
    }
}
