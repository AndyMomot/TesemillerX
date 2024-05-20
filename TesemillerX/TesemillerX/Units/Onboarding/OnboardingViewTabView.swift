//
//  OnboardingViewTabView.swift
//  TesemillerX
//
//  Created by Andrii Momot on 20.05.2024.
//

import SwiftUI

struct OnboardingViewTabView: View {
    private let numberOfTabs = 3
    @State private var currentPageIndex = 1
    
    var body: some View {
        TabView(selection: $currentPageIndex) {
            OnboardingView(
                item: .init(
                    image: Asset.onb1.swiftUIImage,
                    title: "Wybierz się na rodzinną wycieczkę",
                    subtitle: "Twoja rodzina marzy o podróży? ",
                    text: "Teraz możecie wspólnie zbierać pieniądze na Wasze marzenie za pomocą naszej aplikacji! Stwórzcie rodzinny fundusz i zacznijcie odkładać na Wasze przygody razem. Niesamowite podróże czekają na Was!",
                    position: 1),
                numberOfItems: numberOfTabs,
                currentPage: $currentPageIndex)
            .tag(1)
            
            OnboardingView(
                item: .init(
                    image: Asset.onb2.swiftUIImage,
                    title: "Zbiórka funduszy na dom rodzinny",
                    subtitle: "wój dom marzeń jest bliżej, niż myślisz! ",
                    text: "Nasza aplikacja pozwala zbierać fundusze z rodziną na wasz własny dom. Zaczynajcie oszczędzać już dziś i zrealizujcie wspólne marzenie o własnym domu!",
                    position: 2),
                numberOfItems: numberOfTabs,
                currentPage: $currentPageIndex)
            .tag(2)
            
            OnboardingView(
                item: .init(
                    image: Asset.onb3.swiftUIImage,
                    title: "Zbieranie funduszy na szkolenia",
                    subtitle: "Marzysz o lepszej przyszłości dla swoich dzieci? ",
                    text: "Nasza aplikacja umożliwia zbieranie pieniędzy z rodziną na ich edukację. Zaczynajcie oszczędzać już teraz i zapewniajcie swoim dzieciom najlepsze możliwości edukacyjne!",
                    position: 3),
                numberOfItems: numberOfTabs,
                currentPage: $currentPageIndex)
            .tag(3)
        }
        .ignoresSafeArea(edges: .bottom)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .indexViewStyle(.page(backgroundDisplayMode: .never))
    }
}

#Preview {
    OnboardingViewTabView()
}
