//
//  InputFieldView.swift
//  Maximidriveup
//
//  Created by Andrii Momot on 26.04.2024.
//

import SwiftUI

struct InputFieldView: View {
    var placeholder: String
    var rightImage: Image?
    
    @Binding var text: String
    var onRightView: (() -> Void)?
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(Colors.grayLite.swiftUIColor)
            .overlay {
                HStack {
                    TextField(text: $text) {
                        Text(placeholder)
                            .foregroundColor(.white)
                            .font(Fonts.KulimPark.regular.swiftUIFont(size: 20))
                    }
                    .foregroundColor(.white)
                    .font(Fonts.KulimPark.regular.swiftUIFont(size: 20))
                    .background(Colors.grayLite.swiftUIColor)
                    
                    if let image = rightImage {
                        Button {
                            onRightView?()
                        } label: {
                            image
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                        }
                        
                    }
                }
                .padding()
            }
    }
}

struct InputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Colors.grayMiddle.swiftUIColor
            
            InputFieldView(placeholder: "Input text",
                           rightImage: Image(systemName: "plus"),
                           text: .constant(""))
        }
        .frame(height: 50)
    }
}
