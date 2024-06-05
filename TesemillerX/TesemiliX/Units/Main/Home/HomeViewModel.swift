//
//  HomeViewModel.swift
//  TesemillerX
//
//  Created by Andrii Momot on 22.05.2024.
//

import Foundation

extension HomeView {
    final class HomeViewModel: ObservableObject {
        
        @Published var totalAmount: Double = 0
        @Published var myAmount: Double = 0
        
        @Published var budgets: [CreateBudgetView.BudgetModel] = []
        
        @Published var showCreateBudget = false
        @Published var showBudgetDetails = false
        @Published var budgetToShow: CreateBudgetView.BudgetModel?
        
        func onAppear() {
            getBudgets()
            showCreateBudget = false
            showBudgetDetails = false
            calculateAmount()
        }
        
        func getBudgets() {
            budgets = DefaultsService.getBudgets()
        }
        
        func calculatePercent() -> Double {
            if totalAmount > 0 && myAmount >= 0 {
                return (myAmount / totalAmount) * 100.0
            } else {
                return 0.0
            }
        }
    }
}

private extension HomeView.HomeViewModel {
    func calculateAmount() {
        totalAmount = budgets.reduce(0.0) { $0 + $1.amount }
        
        let budgets = DefaultsService.getBudgets().filter {
            $0.contributions.contains(where: { $0.profile.isUser })
        }
        
        var amount: Double {
            var amount: Double = .zero
            
            budgets.forEach { budget in
                let sum = budget.contributions.filter { $0.profile.isUser }.reduce(0.0) { $0 + $1.amount }
                amount += sum
            }
            
            return amount
        }
        
        myAmount = amount
    }
}

extension HomeView.HomeViewModel {
    struct Profile: Identifiable, Codable {
        var id = UUID().uuidString
        var firstName: String
        var lastName: String
        var isUser = false
    }
}
