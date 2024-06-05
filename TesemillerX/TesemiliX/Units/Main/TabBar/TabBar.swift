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
            TabView(selection: $viewModel.selection) {
                ProfileView()
                    .tag(TabBarSelectionView.profile.rawValue)
                
                HomeView()
                    .tag(TabBarSelectionView.home.rawValue)
                
                NotesView()
                    .tag(TabBarSelectionView.notes.rawValue)
                
                SettingsView()
                    .tag(TabBarSelectionView.settings.rawValue)
                    .environmentObject(viewModel)
            }
            .edgesIgnoringSafeArea(.bottom)
            .overlay {
                VStack {
                    Spacer()
                    TabBarView(selectedItem: $viewModel.selection)
                }
                .padding(.horizontal)
            }
    }
}

#Preview {
    TabBar()
}
