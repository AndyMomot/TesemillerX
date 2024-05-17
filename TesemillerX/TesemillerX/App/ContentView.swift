//
// ContentView.swift
// Sample Project
//
// Created by Viktor Kulia on 01.03.2024.
//  

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.3)
                .ignoresSafeArea()
            
            Image(systemName: "house")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundStyle(.red.opacity(0.7))
                .padding()
                .background(Color.black.opacity(0.15))
                .cornerRadius(30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
