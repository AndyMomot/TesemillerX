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

extension DefaultsService {
    static func getProfiles() -> [HomeView.HomeViewModel.Profile] {
        if let data = standard.object(forKey: Keys.profiles.rawValue) as? Data {
            let items = try? JSONDecoder().decode([HomeView.HomeViewModel.Profile].self, from: data)
            return items ?? []
        }
        return []
    }
    
    static func saveProfile(item: HomeView.HomeViewModel.Profile) {
        var profiles = getProfiles()
        profiles.append(item)
        if let data = try? JSONEncoder().encode(profiles) {
            standard.set(data, forKey: Keys.profiles.rawValue)
        }
    }
    
    static func saveProfile(items: [HomeView.HomeViewModel.Profile]) {
        if let data = try? JSONEncoder().encode(items) {
            standard.set(data, forKey: Keys.profiles.rawValue)
        }
    }
}

extension DefaultsService {
    static func getBudgets() -> [CreateBudgetView.BudgetModel] {
        if let data = standard.object(forKey: Keys.budget.rawValue) as? Data {
            let items = try? JSONDecoder().decode([CreateBudgetView.BudgetModel].self, from: data)
            return items ?? []
        }
        return []
    }
    
    static func saveBudget(item: CreateBudgetView.BudgetModel) {
        var items = getBudgets()
        items.append(item)
        if let data = try? JSONEncoder().encode(items) {
            standard.set(data, forKey: Keys.budget.rawValue)
        }
    }
    
    static func saveProfile(items: [CreateBudgetView.BudgetModel]) {
        if let data = try? JSONEncoder().encode(items) {
            standard.set(data, forKey: Keys.budget.rawValue)
        }
    }
}


// MARK: - Keys
extension DefaultsService {
    enum Keys: String {
        case flow
        case profiles
        case budget
    }
}