//
//  CreatePersonViewModel.swift
//  TesemillerX
//
//  Created by Andrii Momot on 24.05.2024.
//

import SwiftUI

extension CreatePersonView {
    final class CreatePersonViewModel: ObservableObject {
        @Published var showImagePicker = false
        @Published var selectedImage: UIImage = (.init(systemName: "person.circle.fill") ?? .init())
        @Published var firstName = ""
        @Published var lastName = ""
        
        var isValidFields: Bool {
            return !firstName.isEmpty && !lastName.isEmpty
        }
        
        var isValidImage: Bool {
            selectedImage != .init(systemName: "person.circle.fill")!
        }
        
        func savePerson(completion: @escaping () -> Void) {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                guard self.isValidFields else { return }
                
                let profile = HomeView.HomeViewModel.Profile(
                    firstName: self.firstName,
                    lastName: self.lastName
                )
                
                DefaultsService.saveProfile(item: profile)
                
                guard self.isValidFields,
                      let imageData = self.selectedImage.jpegData(compressionQuality: 1)
                else {
                    completion()
                    return
                }
                
                let path = FileManagerService.Keys.profileImage(id: profile.id).path
                FileManagerService().saveFile(data: imageData, forPath: path)
                completion()
            }
        }
    }
}
