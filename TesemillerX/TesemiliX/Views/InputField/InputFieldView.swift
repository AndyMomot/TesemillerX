//
//  InputFieldView.swift
//  Maximidriveup
//
//  Created by Andrii Momot on 26.04.2024.
//

import SwiftUI

struct InputFieldView<RightView: View>: View {
    var placeholder: String
    var rightView: RightView
    var canEdit = true
    
    @Binding var text: String
    var onRightView: (() -> Void)?
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(Colors.grayLite.swiftUIColor)
            .overlay {
                HStack {
                    if canEdit {
                        TextField(text: $text) {
                            Text(placeholder)
                                .foregroundColor(.white)
                                .font(Fonts.KulimPark.regular.swiftUIFont(size: 20))
                        }
                        .foregroundColor(.white)
                        .font(Fonts.KulimPark.regular.swiftUIFont(size: 20))
                        .background(Colors.grayLite.swiftUIColor)
                    } else {
                        
                        let textToShow = text.isEmpty ? placeholder : text
                        Text(textToShow)
                            .foregroundColor(.white)
                            .font(Fonts.KulimPark.regular.swiftUIFont(size: 20))
                        
                        Spacer()
                    }
                    
                    Button {
                        onRightView?()
                    } label: {
                        rightView
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
                           rightView: EmptyView(),
                           text: .constant(""))
        }
        .frame(height: 50)
    }
}
