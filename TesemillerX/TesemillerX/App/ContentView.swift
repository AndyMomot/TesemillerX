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
                if viewModel.isAuthorized {
                    Text("Home")
                } else {
                    Text("Auth")
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.viewModel.showPreloader.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
