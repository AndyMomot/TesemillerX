//
//  HomeViewModel.swift
//  TesemillerX
//
//  Created by Andrii Momot on 22.05.2024.
//

import Foundation

extension HomeView {
    final class  HomeViewModel: ObservableObject {
        
        @Published var totalAmount: Double = 0
        @Published var myAmount: Double = 0
    }
}

extension HomeView.HomeViewModel {
    struct Profile: Identifiable, Codable {
        private(set) var id = UUID().uuidString
        var firstName: String
        var lastName: String
    }
}
