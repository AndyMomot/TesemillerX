//
//  CreateBudgetViewModel.swift
//  TesemillerX
//
//  Created by Andrii Momot on 26.05.2024.
//

import Foundation

extension CreateBudgetView {
    final class CreateBudgetViewModel: ObservableObject {
        @Published var name: String = ""
        @Published var dateString = ""
        @Published var date: Date = .init()
        @Published var description: String = ""
        @Published var showDatePicker = false
        @Published var amount: String = ""
        
        private var profiles: [HomeView.HomeViewModel.Profile] = []
        private var didSetDate = false
        
        private var isValidFields: Bool {
            !profiles.isEmpty && !name.isEmpty && 
            !dateString.isEmpty && Int(amount) != nil
        }
        
        func updateDateString(with date: Date) {
            dateString = date.toString(format: .ddMMyyyy)
            didSetDate = true
        }
        
        func setProfiles(_ profiles: [HomeView.HomeViewModel.Profile]) {
            self.profiles = profiles
        }
        
        func createBudget(completion: @escaping () -> Void) {
            guard isValidFields else { return }
            
            DispatchQueue.main.async {
                let model = BudgetModel(
                    profiles: self.profiles,
                    name: self.name,
                    date: self.didSetDate ? self.date : nil ,
                    description: self.description,
                    amount: Double(self.amount) ?? .zero
                )
                
                DefaultsService.saveBudget(item: model)
                completion()
            }
        }
    }
}

extension CreateBudgetView {
    struct BudgetModel: Identifiable, Codable, Hashable {
        private(set) var id = UUID().uuidString
        var profiles: [HomeView.HomeViewModel.Profile]
        var name: String
        var date: Date?
        var description: String
        var amount: Double
        var completed: Double = 0
        
        var percent: Double { // 0...100
            if completed > 0 && amount >= 0 {
                return (completed / amount) * 100.0
            } else {
                return 0.0
            }
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        static func == (lhs: CreateBudgetView.BudgetModel, rhs: CreateBudgetView.BudgetModel) -> Bool {
            lhs.id == rhs.id
        }
    }
}
