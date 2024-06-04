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
            DispatchQueue.main.async { [weak self] in
                self?.getBudgets()
                self?.showCreateBudget = false
                self?.showBudgetDetails = false
                self?.calculateAmount()
            }
        }
        
        func getBudgets() {
            budgets = []
            budgets = DefaultsService.getBudgets()
        }
    }
}

private extension HomeView.HomeViewModel {
    func calculateAmount() {
        totalAmount = budgets.reduce(0.0) { $0 + $1.amount }
        myAmount = budgets.reduce(0.0) { $0 + $1.completed }
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
