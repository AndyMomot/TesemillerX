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
        
        @Published var profile: HomeView.HomeViewModel.Profile = .init(
            firstName: "",
            lastName: "",
            isUser: false
        )
        
        private var isEdit = false
        
        var isValidFields: Bool {
            return !profile.firstName.isEmpty && !profile.lastName.isEmpty
        }
        
        var isValidImage: Bool {
            selectedImage != .init(systemName: "person.circle.fill")!
        }
        
        func setProfile(_ profile: HomeView.HomeViewModel.Profile?) {
            guard let profile = profile else { return }
            isEdit = true
            
            if let image = getProfileImage(for: profile.id) {
                selectedImage = image
            }
            
            self.profile = profile
        }
        
        func getProfileImage(for id: String) -> UIImage? {
            let path = FileManagerService.Keys.profileImage(id: id).path
            guard let data = FileManagerService().getFile(forPath: path),
                  let uiImage = UIImage(data: data)
            else {
                return nil
            }
            
            return uiImage
        }
        
        func savePerson(completion: @escaping () -> Void) {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                guard self.isValidFields else { return }
                
                if isEdit {
                    var profiles = DefaultsService.getProfiles()
                    if let index = profiles.firstIndex(where: {
                        $0.id == self.profile.id
                    }) {
                        profiles[index] = self.profile
                        DefaultsService.saveProfile(items: profiles)
                    } else {
                        DefaultsService.saveProfile(item: self.profile)
                    }
                    
                } else {
                    DefaultsService.saveProfile(item: self.profile)
                }
                
                guard self.isValidFields,
                      let imageData = self.selectedImage.jpegData(compressionQuality: 1)
                else {
                    completion()
                    return
                }
                
                let path = FileManagerService.Keys.profileImage(id: self.profile.id).path
                FileManagerService().saveFile(data: imageData, forPath: path)
                completion()
            }
        }
    }
}
