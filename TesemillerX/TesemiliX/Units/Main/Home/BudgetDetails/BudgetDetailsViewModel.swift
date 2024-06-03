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
        @Published var progressRightPadding: CGFloat = 0
        @Published var showTopUp = false
        
        var budgetId: String = ""
        
        func calculateProgressWith(screen width: CGFloat, budget: CreateBudgetView.BudgetModel) {
            let width = width - (30 * 2)
            let multiplier = CGFloat(budget.percent / 100)
            let padding = width - (width * multiplier)
            
            print("padding", padding)
            
            progressRightPadding = padding
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
    }
}
