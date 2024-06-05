//
//  TabBarViewModel.swift
//  Mastenirby
//
//  Created by Andrii Momot on 02.05.2024.
//

import Foundation
import SwiftUI

extension TabBar {
    final class TabBarViewModel: ObservableObject {
        @Published var selection = TabBarSelectionView.home.rawValue
    }
}

extension TabBar {
    enum TabBarSelectionView: Int {
        case profile = 0
        case home = 1
        case notes = 2
        case settings = 3
    }
    
    struct Item: Identifiable {
        private(set) var id = UUID()
        var image: Image
    }
}
