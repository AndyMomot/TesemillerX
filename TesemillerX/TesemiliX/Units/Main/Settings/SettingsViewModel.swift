//
//  SettingsViewModel.swift
//  TesemiliX
//
//  Created by Andrii Momot on 05.06.2024.
//

import Foundation
import UIKit

extension SettingsView {
    final class SettingsViewModel: ObservableObject {
        @Published var showEditProfile = false
        @Published var showSupport = false
        
        @Published var showPrivacy = false
        
        let supportURL = URL(string: "https://support.tesemilix.info")
        let privacyURL = URL(string: "https://tesemilix.info/")
        
        let itemsFirstSection: [Item] = [
            .editProfile,
            .support,
            .notifications,
            .privacy
        ]
        
        let itemsSecondSection: [Item] = [
            .deleteCache,
            .updateApp
        ]
        
        var profile: HomeView.HomeViewModel.Profile = .init(
            firstName: "",
            lastName: "",
            isUser: true
        )
        
        func onItemTapped(_ item: Item) {
            switch item {
            case .editProfile:
                showEditProfile.toggle()
            case .support:
                showSupport.toggle()
            case .notifications:
                openSettings()
            case .privacy:
                showPrivacy.toggle()
            case .deleteCache:
                DefaultsService.removeAll()
            case .updateApp:
                openAppStoreLink()
            }
        }
        
        func getProfile() {
            if let userProfile = DefaultsService.getProfiles().first(where: { $0.isUser }) {
                profile = userProfile
            }
        }
        
        private func openSettings() {
            guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsURL) {
                UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
            }
        }
        
        func openAppStoreLink() {
            let appStoreLink = "https://apps.apple.com/us/app/example-app/id1234567890" // Replace with your App Store link
            
            guard let url = URL(string: appStoreLink) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}

extension SettingsView {
    enum Item {
        case editProfile
        case support
        case notifications
        case privacy
        case deleteCache
        case updateApp
        
        var title: String {
            switch self {
            case .editProfile:
                return "Edytuj profil "
            case .support:
                return "Wsparcie"
            case .notifications:
                return "Powiadomienia"
            case .privacy:
                return "Polityka prywatności"
            case .deleteCache:
                return "Usuń pamięć podręczną"
            case .updateApp:
                return "Aktualizacja systemu"
            }
        }
        
        var imageName: String {
            switch self {
            case .editProfile:
                return Asset.editProfile.name
            case .support:
                return Asset.support.name
            case .notifications:
                return Asset.notifications.name
            case .privacy:
                return Asset.privacy.name
            case .deleteCache:
                return Asset.deleteCache.name
            case .updateApp:
                return Asset.updateApp.name
            }
        }
    }
}
