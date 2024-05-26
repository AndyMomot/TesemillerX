//
//  InputFieldResizable.swift
//  Mastenirby
//
//  Created by Andrii Momot on 08.05.2024.
//

import SwiftUI

struct InputFieldResizable: View {
    var placeholder: String = ""
    
    @Binding var text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(Colors.grayLite.swiftUIColor)
            .overlay {
                VStack(spacing: 8) {
                    HStack {
                        Text(placeholder)
                            .foregroundColor(.white)
                            .font(Fonts.KulimPark.regular.swiftUIFont(size: 20))
                        Spacer()
                    }
                    
                    TextEditor(text: $text)
                        .scrollContentBackground(.hidden)
                        .background(Colors.grayLite.swiftUIColor)
                        .foregroundColor(.white)
                        .font(Fonts.KulimPark.regular.swiftUIFont(size: 20))
                }
                .padding()
            }
    }
}

#Preview {
    InputFieldResizable(placeholder: "Opis",
                        text: .constant(""))
    .frame(minHeight: 150)
}
