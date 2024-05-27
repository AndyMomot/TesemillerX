//
//  PreloaderView.swift
//  TesemillerX
//
//  Created by Andrii Momot on 17.05.2024.
//

import SwiftUI

struct PreloaderView: View {
    @StateObject private var viewModel = PreloaderViewModel()
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                HStack(spacing: 30) {
                    Spacer()
                    Asset.logoShort.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: bounds.width * 0.15,
                               height: bounds.height * 0.09)
                    
                    LoaderView()
                        .frame(height: 14)
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    PreloaderView()
}
