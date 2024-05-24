//
//  InputFieldResizable.swift
//  Mastenirby
//
//  Created by Andrii Momot on 08.05.2024.
//

import SwiftUI

struct InputFieldResizable: View {
    var title: String?
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Colors.grayLite.swiftUIColor)
            
            TextEditor(text: $text)
                .background(Colors.grayLite.swiftUIColor)
                .foregroundColor(.white)
                .font(Fonts.KulimPark.regular.swiftUIFont(size: 20))
                .padding()
                .colorScheme(.light)
                
        }
    }
}

#Preview {
    InputFieldResizable(title: "Opis",
                        text: .constant("Lorem ipsum dolor sit amet consectetur. Eget velit vitae nec dictum Massa Phasellus. Urna sem facilisis purus vitae sollicitudin praesent. Imperdiet vitae tellus aliquam porttitor justo. Enim at sed at duis adipiscing tellus ornare leo ut."))
    .frame(minHeight: 150)
}
