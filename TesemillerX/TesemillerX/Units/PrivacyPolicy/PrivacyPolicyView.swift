//
//  PrivacyPolicyView.swift
//  TesemillerX
//
//  Created by Andrii Momot on 20.05.2024.
//

import SwiftUI

struct PrivacyPolicyView: View {
    @StateObject private var viewModel = PrivacyPolicyViewModel()
    @EnvironmentObject var rootViewModel: ContentView.ContentViewModel
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 40) {
                HStack(spacing: 0) {
                    Text("Tesemiller")
                        .foregroundStyle(.white)
                        .font(Fonts.KulimPark.bold.swiftUIFont(size: 29))
                    Text("X")
                        .foregroundStyle(Colors.redCustom.swiftUIColor)
                        .font(Fonts.KulimPark.bold.swiftUIFont(size: 29))
                }
                
                Spacer()
                
                Asset.pp.swiftUIImage
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .center, spacing: 8) {
                    HStack(spacing: 0) {
                        Text("Witamy w Tesemiller")
                            .foregroundStyle(.white)
                            .font(Fonts.KulimPark.bold.swiftUIFont(size: 23))
                        Text("X")
                            .foregroundStyle(Colors.redCustom.swiftUIColor)
                            .font(Fonts.KulimPark.bold.swiftUIFont(size: 23))
                    }
                    
                    Text("Nasza polityka prywatnosci zapewnia ochrone danych osobowych uzytkowników.")
                        .foregroundStyle(.white)
                        .font(Fonts.KulimPark.light.swiftUIFont(size: 18))
                        .multilineTextAlignment(.center)
                }
                
                Button {
                    if viewModel.isAgreed {
                        withAnimation {
                            rootViewModel.setFlow(.main)
                        }
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 24)
                        .foregroundStyle(Colors.greenCustom.swiftUIColor)
                    .frame(height: 48)
                    .overlay {
                        HStack {
                            Image(systemName: "arrow.left")
                                .opacity(.zero)
                            Spacer()
                            Text("Akceptuj")
                            Spacer()
                            Image(systemName: "arrow.right")
                        }
                        .foregroundStyle(.white)
                        .font(Fonts.KulimPark.bold.swiftUIFont(size: 16))
                        .padding(.horizontal)
                    }
                    .padding(.horizontal, 80)
                }

                CheckBoxView(text: "Zgadzam sie z ",
                             highlightedText: "polityka prywatnosci",
                             url: viewModel.url) { isAgreed in
                    viewModel.isAgreed = isAgreed
                }
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    PrivacyPolicyView()
}
