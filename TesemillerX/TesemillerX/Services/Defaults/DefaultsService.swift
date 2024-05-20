//
//  DefaultsService.swift
//  Maximidriveup
//
//  Created by Andrii Momot on 16.04.2024.
//

import Foundation

final class DefaultsService {
    static let standard = UserDefaults.standard
    private init() {}
}

extension DefaultsService {
    static var flow: ContentView.ViewState {
        let name = standard.string(forKey: Keys.flow.rawValue) ?? ""
        return ContentView.ViewState(rawValue: name) ?? .onboarding
    }
    
    static func setFlow(_ flow: ContentView.ViewState) {
        standard.set(flow.rawValue, forKey: Keys.flow.rawValue)
    }
}

// MARK: - Keys
extension DefaultsService {
    enum Keys: String {
        case flow
    }
}
