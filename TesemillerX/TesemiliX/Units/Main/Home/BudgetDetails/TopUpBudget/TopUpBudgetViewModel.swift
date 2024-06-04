//
//  TopUpBudgetViewModel.swift
//  TesemiliX
//
//  Created by Andrii Momot on 03.06.2024.
//

import Foundation
import SwiftUI

extension TopUpBudgetView {
    final class TopUpBudgetViewModel: ObservableObject {
        var budgetId: String = ""
        
        @Published var savedProfiles: [HomeView.HomeViewModel.Profile] = []
        @Published var selectedProfile: HomeView.HomeViewModel.Profile?
        @Published var amount: String = ""
        
        func getSavedProfiles() {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.savedProfiles = DefaultsService.getProfiles()
            }
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
        
        func topUpBudget(completion: @escaping () -> Void) {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                guard let profile = self.selectedProfile,
                        let amount = Double(self.amount)
                else { return }
                
                let model = CreateBudgetView.BudgetModel.Contribution(
                    profile: profile,
                    amount: amount
                )
                
                var items = DefaultsService.getBudgets()

                if let index = items.firstIndex(where: {
                    $0.id == self.budgetId
                }) {
                    items[index].contributions.append(model)
                    DefaultsService.saveBudget(items: items)
                    completion()
                } 
            }
        }
    }
}
