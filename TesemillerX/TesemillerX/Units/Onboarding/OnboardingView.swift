//
//  OnboardingView.swift
//  TesemillerX
//
//  Created by Andrii Momot on 20.05.2024.
//

import SwiftUI

struct OnboardingView: View {
    var item: OnboardingItem
    var numberOfItems: Int
    @Binding var currentPage: Int
    
    @EnvironmentObject var rootViewModel: ContentView.ContentViewModel
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 40) {
                    HStack(spacing: 0) {
                        Text("Tesemiller")
                            .foregroundStyle(.white)
                            .font(Fonts.KulimPark.bold.swiftUIFont(size: 29))
                        Text("X")
                            .foregroundStyle(Colors.redCustom.swiftUIColor)
                            .font(Fonts.KulimPark.bold.swiftUIFont(size: 29))
                    }
                    
                    item.image
                        .resizable()
                        .scaledToFit()
                    
                    
                    VStack(spacing: 18) {
                        HStack {
                            Text(item.title)
                                .multilineTextAlignment(.leading)
                                .foregroundStyle(.white)
                                .font(Fonts.KulimPark.bold.swiftUIFont(size: 29))
                            
                            Spacer()
                        }
                        
                        HStack {
                            Group {
                                Text(item.subtitle)
                                    .foregroundColor(Colors.redCustom.swiftUIColor)
                                +
                                Text(item.text)
                                    .foregroundColor(.white)
                            }
                            .font(Fonts.KulimPark.regular.swiftUIFont(size: 14))
                            Spacer()
                        }
                    }
                    
                    let arrange = Array(1...numberOfItems)
                    HStack(spacing: 20) {
                        Spacer()
                        ForEach(arrange, id: \.self) { index in
                            
                            
                            var isSelected = item.position == index
                            Rectangle()
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                                .foregroundStyle(
                                    isSelected ? Colors.grayCustom.swiftUIColor :
                                        Colors.darkGrayCustom.swiftUIColor
                                )
                        }
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        HStack(spacing: 8) {
                            Text("Rozpocznij planowanie")
                                .foregroundStyle(.white)
                                .font(Fonts.KulimPark.light.swiftUIFont(size: 14))
                            Button {
                                withAnimation {
                                    onNext()
                                }
                            } label: {
                                Circle()
                                    .foregroundStyle(.white)
                                    .frame(width: 58, height: 58)
                                    .overlay {
                                        Image(systemName: "arrow.right")
                                            .foregroundStyle(Colors.redCustom.swiftUIColor)
                                            .font(Fonts.KulimPark.regular.swiftUIFont(size: 30))
                                    }
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

private extension OnboardingView {
    func onNext() {
        let nextPageIndex = item.position + 1
        if nextPageIndex <= numberOfItems {
            currentPage = nextPageIndex
        } else {
            rootViewModel.viewState = .privacy
        }
    }
}

extension OnboardingView {
    struct OnboardingItem {
        var image: Image
        var title: String
        var subtitle: String
        var text: String
        var position: Int
    }
}

#Preview {
    OnboardingView(
        item: .init(
            image: Asset.onb1.swiftUIImage,
            title: "Wybierz się na rodzinną wycieczkę",
            subtitle: "Twoja rodzina marzy o podróży?",
            text: "Teraz możecie wspólnie zbierać pieniądze na Wasze marzenie za pomocą naszej aplikacji! Stwórzcie rodzinny fundusz i zacznijcie odkładać na Wasze przygody razem. Niesamowite podróże czekają na Was!",
            position: 1),
        numberOfItems: 3, 
        currentPage: .constant(1))
}
