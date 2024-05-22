//
//  Comparable+Additions.swift
//  Mastenirby
//
//  Created by Andrii Momot on 07.05.2024.
//

import Foundation

extension Comparable {
    func clamped(to range: ClosedRange<Self>) -> Self {
        return min(max(self, range.lowerBound), range.upperBound)
    }
}
