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
        
        @Published var viewState: ViewState = .onboarding
        
        func getFlow() {
            viewState = DefaultsService.flow
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.showPreloader = false
            }
        }
        
        func setFlow(_ flow: ViewState) {
            DefaultsService.setFlow(flow)
            getFlow()
        }
    }
}

extension ContentView {
    enum ViewState: String {
        case onboarding
        case privacy
        case main
    }
}
