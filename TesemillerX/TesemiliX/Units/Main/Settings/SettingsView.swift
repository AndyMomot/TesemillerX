//
//  SettingsView.swift
//  TesemiliX
//
//  Created by Andrii Momot on 05.06.2024.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var contentViewModel: ContentView.ContentViewModel
    @StateObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundGradientView()
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 60) {
                    
                    Text("USTAWIENIA")
                        .foregroundStyle(.white)
                        .font(Fonts.KulimPark.semiBold.swiftUIFont(size: 20))
                        .padding()
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 44) {
                            VStack(alignment: .leading, spacing: 14) {
                                ForEach(viewModel.itemsFirstSection, id: \.title) { item in
                                    Button {
                                        viewModel.onItemTapped(item)
                                    } label: {
                                        SettingCell(item: item)
                                    }
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 14) {
                                ForEach(viewModel.itemsSecondSection, id: \.title) { item in
                                    Button {
                                        viewModel.onItemTapped(item)
                                        
                                        if item == .deleteCache {
                                            contentViewModel.setFlow(.onboarding)
                                        }
                                        
                                    } label: {
                                        SettingCell(item: item)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .onAppear {
            viewModel.getProfile()
        }
        .sheet(isPresented: $viewModel.showEditProfile) {
            CreatePersonView(profile: viewModel.profile) {
                viewModel.getProfile()
            }
        }
        .sheet(isPresented: $viewModel.showSupport) {
            WebView(url: viewModel.supportURL)
        }
        .sheet(isPresented: $viewModel.showPrivacy) {
            WebView(url: viewModel.privacyURL)
        }
    }
}

#Preview {
    SettingsView()
}
