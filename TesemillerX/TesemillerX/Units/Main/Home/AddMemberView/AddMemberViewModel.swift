//
//  AddMemberViewModel.swift
//  TesemillerX
//
//  Created by Andrii Momot on 24.05.2024.
//

import Foundation
import SwiftUI

extension AddMemberView {
    final class AddMemberViewModel: ObservableObject {
        @Published var savedProfiles: [HomeView.HomeViewModel.Profile] = []
        @Published var selectedProfiles: [HomeView.HomeViewModel.Profile] = []
        @Published var completedPercent: Double? = 100
        @Published var showAddPerson = false
        @Published var showCreatePerson = false
        @Published var searchText = ""
    }
}

extension AddMemberView.AddMemberViewModel {
    func getProfileImage(for id: String) -> Image? {
        let path = FileManagerService.Keys.profileImage(id: id).path
        guard let data = FileManagerService().getFile(forPath: path),
              let uiImage = UIImage(data: data)
        else {
            return nil
        }
        
        return Image(uiImage: uiImage)
    }
    
    func getSavedProfiles() {
        DispatchQueue.main.async {
            self.savedProfiles = DefaultsService.getProfiles()
        }
    }
    
    func addSelected(profile: HomeView.HomeViewModel.Profile) {
        if !selectedProfiles.contains(where: {
            $0.id == profile.id
        }) {
            selectedProfiles.append(profile)
        }
    }
    
    func getSelectedProfiles() -> [HomeView.HomeViewModel.Profile] {
        selectedProfiles
    }
    
    func removeProfileFromStack(profile id: String) {
        selectedProfiles.removeAll(where: {$0.id == id })
    }
    
    func deleteItem(at offsets: IndexSet) {
        DispatchQueue.main.async {
            self.savedProfiles.remove(atOffsets: offsets)
            DefaultsService.saveProfile(items: self.savedProfiles)
            self.getSavedProfiles()
        }
    }
    
    // Функция для фильтрации профилей по тексту
    func filterProfiles() {
        if searchText.isEmpty {
            getSavedProfiles()
        } else {
            let lowercasedSearchText = searchText.lowercased()
            savedProfiles = DefaultsService.getProfiles().filter { profile in
                profile.firstName.lowercased().contains(lowercasedSearchText) ||
                profile.lastName.lowercased().contains(lowercasedSearchText)
            }
        }
    }
}
