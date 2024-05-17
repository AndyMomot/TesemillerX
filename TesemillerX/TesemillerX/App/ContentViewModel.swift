//
//  ContentViewModel.swift
//  TesemillerX
//
//  Created by Andrii Momot on 17.05.2024.
//

import Foundation

extension ContentView {
    final class ContentViewModel: ObservableObject {
        @Published var showPreloader = true
        @Published var isAuthorized = false
    }
}
