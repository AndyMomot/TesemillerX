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
        GeometryReader { geometry in
            TabView(selection: $viewModel.selection) {
                ProfileView()
                    .tag(TabBarSelectionView.profile.rawValue)
                    .environmentObject(viewModel)
                
                
                HomeView()
                    .tag(TabBarSelectionView.home.rawValue)
                    .environmentObject(viewModel)
                
                NotesView()
                    .tag(TabBarSelectionView.notes.rawValue)
                    .environmentObject(viewModel)
                
                Text("settings")
                    .tag(TabBarSelectionView.settings.rawValue)
                    .environmentObject(viewModel)
            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .edgesIgnoringSafeArea(.bottom)
            .overlay {
                VStack {
                    Spacer()
                    TabBarView(selectedItem: $viewModel.selection)
                }
                .padding(.horizontal)
                .padding(.bottom, -geometry.safeAreaInsets.bottom / 2)
            }
        }
    }
}

#Preview {
    TabBar()
}
