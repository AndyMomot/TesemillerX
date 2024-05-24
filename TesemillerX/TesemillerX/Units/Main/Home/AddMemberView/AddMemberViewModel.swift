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
        @Published var showAddPerson = true
        @Published var showCreatePerson = false
        @Published var searchText = ""
    }
}

extension AddMemberView.AddMemberViewModel {
    func getProfileImage(for id: String) -> Image? {
        let path = "profileImage/\(id)"
        guard let data = FileManagerService().getFile(forPath: path),
              let uiImage = UIImage(data: data)
        else {
            return nil
        }
        
        return Image(uiImage: uiImage)
    }
    
    func removeProfileFromStack(profile id: String) {
        selectedProfiles.removeAll(where: {$0.id == id })
    }
}
