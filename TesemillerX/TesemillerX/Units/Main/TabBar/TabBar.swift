//
//  TabBar.swift
//  Mastenirby
//
//  Created by Andrii Momot on 02.05.2024.
//

import SwiftUI

struct TabBar: View {
    @StateObject private var viewModel = TabBarViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $viewModel.selection) {
                ZStack {
                    BackgroundGradientView()
                        .ignoresSafeArea()
                    
                    ScrollView {
                        VStack {
                            Rectangle()
                                .frame(height: 300)
                            Rectangle()
                                .frame(height: 300)
                            Rectangle()
                                .frame(height: 300)
                            Rectangle()
                                .frame(height: 300)
                        }
                    }
                }
                .tag(TabBarSelectionView.profile.rawValue)
                .environmentObject(viewModel)
                
                
                Text("home")
                    .tag(TabBarSelectionView.home.rawValue)
                    .environmentObject(viewModel)
                
                Text("notifications")
                    .tag(TabBarSelectionView.notifications.rawValue)
                    .environmentObject(viewModel)
                
                Text("settings")
                    .tag(TabBarSelectionView.settings.rawValue)
                    .environmentObject(viewModel)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .bottom) {
                TabBarView(selectedItem: $viewModel.selection)
                    .frame(height: UIScreen.main.bounds.height * 0.06)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    TabBar()
}
