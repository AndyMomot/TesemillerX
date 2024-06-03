//
//  BudgetDetailsViewModel.swift
//  TesemiliX
//
//  Created by Andrii Momot on 31.05.2024.
//

import Foundation
import SwiftUI

extension BudgetDetailsView {
    final class BudgetDetailsViewModel: ObservableObject {
        @Published var budget: CreateBudgetView.BudgetModel = .init(
            profiles: [],
            name: "",
            description: "",
            amount: .zero
        )
        @Published var showTopUp = false
        @Published var progress: CGFloat = 0
        
        var budgetId: String = ""
        
        func calculateProgressWith() {
            progress = min(max(CGFloat(budget.percent) / 100, 0), 1)
        }
        
        func getProfileImage(for id: String) -> Image? {
            let path = FileManagerService.Keys.profileImage(id: id).path
            guard let data = FileManagerService().getFile(forPath: path),
                  let uiImage = UIImage(data: data)
            else {
                return nil
            }
            
            return Image(uiImage: uiImage)
        }
        
        func updateBudget() {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                let budgets = DefaultsService.getBudgets()
                if let newValue = budgets.first(where: {
                    $0.id == self.budgetId
                }) {
                    self.budget = newValue
                }
                
                self.calculateProgressWith()
            }
        }
        
        func deleteContribution(with id: String) {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                if let index = self.budget.contributions.firstIndex(where: { $0.id == id }) {
                    self.budget.contributions.remove(at: index)
                    
                    var budgets = DefaultsService.getBudgets()
                    if let budgetIndex = budgets.firstIndex(where: {
                        $0.id == self.budget.id
                    }) {
                        budgets[budgetIndex] = self.budget
                        DefaultsService.saveBudget(items: budgets)
                        self.calculateProgressWith()
                    }
                }
            }
        }
        
        func deleteBudget(completion: @escaping () -> Void) {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                var budgets = DefaultsService.getBudgets()
                if let budgetIndex = budgets.firstIndex(where: {
                    $0.id == self.budget.id
                }) {
                    budgets.remove(at: budgetIndex)
                    DefaultsService.saveBudget(items: budgets)
                    completion()
                }
            }
        }
    }
}
