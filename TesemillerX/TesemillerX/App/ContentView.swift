//
// ContentView.swift
// Sample Project
//
// Created by Viktor Kulia on 01.03.2024.
//  

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.showPreloader {
                PreloaderView()
            } else {
                switch viewModel.viewState {
                case .onboarding:
                    OnboardingViewTabView()
                        .environmentObject(viewModel)
                case .privacy:
                    PrivacyPolicyView()
                        .environmentObject(viewModel)
                case .main:
                    Text("Home")
                }
            }
        }
        .onAppear {
            withAnimation {
                self.viewModel.getFlow()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
