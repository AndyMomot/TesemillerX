//
//  AdviceDetailsView.swift
//  TesemiliX
//
//  Created by Andrii Momot on 04.06.2024.
//

import SwiftUI

struct AdviceDetailsView: View {
    var item: ProfileView.ProfileViewModel.Advice
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 22) {
                    
                    // Image
                    ZStack {
                        Image(item.mainImage)
                            .resizable()
                            .scaledToFit()
                            .padding(.top)
                        
                        // Back button
                        VStack {
                            HStack {
                                Button {
                                    dismiss.callAsFunction()
                                } label: {
                                    Circle()
                                        .foregroundStyle(Colors.greenCustom.swiftUIColor)
                                        .frame(width: 45)
                                        .overlay {
                                            Image(systemName: "arrow.left")
                                                .foregroundStyle(.white)
                                                .font(Fonts.KulimPark.regular.swiftUIFont(size: 24))
                                        }
                                }
                                
                                Spacer()
                            }
                            
                            Spacer()
                        }
                    }
                    
                    // Title
                    Text(item.title)
                        .foregroundStyle(.white)
                        .font(Fonts.KulimPark.bold.swiftUIFont(size: 36))
                    
                    // Text
                    Text(item.text)
                        .foregroundStyle(.white)
                        .font(Fonts.KulimPark.light.swiftUIFont(size: 14))
                }
                .padding(.horizontal, 30)
                .padding(.bottom, UIScreen.main.bounds.height * 0.1)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    AdviceDetailsView(
        item: .init(
            previewImage: "Rectangle29",
            mainImage: "Rectangle34",
            title: "Kupno domu",
            text: """
                             1. Określenie celu: Starannie określ, jaką nieruchomość chcesz kupić. Ustal konkretne parametry, takie jak wielkość, lokalizacja i budżet.
                             
                             2. Obliczenie wymaganej kwoty: Oceń, ile potrzebujesz środków na zakup wybranej przez Ciebie nieruchomości. Weź pod uwagę koszt samego domu, a także dodatkowe wydatki, takie jak podatki, prowizje agencji nieruchomości i remont.
                             
                             3. Ustalenie terminów: Określ, jak szybko chcesz zgromadzić wymaganą kwotę. Rozplanuj proces oszczędzania na konkretne miesiące i lata, aby mieć klarowny plan osiągnięcia celu.
                             
                             4. Stworzenie budżetu: Sporządź budżet, w którym jasno uwzględnione są Twoje dochody i wydatki. Określ, ile możesz odłożyć na zakup domu każdego miesiąca.
                             
                             5. Otwarcie osobnego konta bankowego: Rozważ otwarcie osobnego konta bankowego do przechowywania środków przeznaczonych na zakup domu. pomoże to łatwiej oddzielić te pieniądze od innych wydatków.
                             
                             6. Regularne oszczędzanie: Trzymaj się swojego planu oszczędzania, regularnie wpłacając odpowiednią kwotę na swoje konto na zakup domu.
                             
                             7. Monitorowanie postępów: Okresowo sprawdzaj swoje postępy w oszczędzaniu pieniędzy. Przeglądaj swój budżet i oszczędności, aby upewnić się, że jesteś na właściwej drodze do osiągnięcia celu.
                             
                             8. Dostosowywanie strategii: W razie potrzeby dostosuj swój plan oszczędzania w zależności od zmieniających się okoliczności lub warunków finansowych.
                             """))
}
