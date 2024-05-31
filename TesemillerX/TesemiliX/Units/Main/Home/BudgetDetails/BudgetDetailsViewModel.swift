//
//  BudgetDetailsViewModel.swift
//  TesemiliX
//
//  Created by Andrii Momot on 31.05.2024.
//

import Foundation

extension BudgetDetailsView {
    final class BudgetDetailsViewModel: ObservableObject {
        @Published var progressRightPadding: CGFloat = 0
        
        func calculateProgressWith(screen width: CGFloat, budget: CreateBudgetView.BudgetModel) {
            let width = width - (30 * 2)
            let multiplier = CGFloat(budget.percent / 100)
            let padding = width - (width * multiplier)
            
            print("padding", padding)
            
            progressRightPadding = padding
        }
    }
}
