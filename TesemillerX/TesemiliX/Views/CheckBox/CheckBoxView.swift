//
//  CheckBoxView.swift
//  Maximidriveup
//
//  Created by Andrii Momot on 16.04.2024.
//

import SwiftUI

struct CheckBoxView: View {
    var text: String
    var highlightedText: String
    var url: URL?
    var onTap: (Bool) -> Void
    
    @State private var selection = false
    @State private var showWebView = false
    
    init(text: String, highlightedText: String, url: URL?, onTap: @escaping (Bool) -> Void) {
        self.text = text
        self.highlightedText = highlightedText
        self.url = url
        self.onTap = onTap
    }
    
    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                Rectangle()
                    .scaledToFit()
                    .foregroundColor(Colors.blueCustom.swiftUIColor)
                    .frame(width: 21)
                    .cornerRadius(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.white, lineWidth: 1)
                    )
                    .onTapGesture {
                        selection.toggle()
                        onTap(selection)
                    }
                
                if selection {
                    Image(systemName: "checkmark", variableValue: 1)
                        .symbolRenderingMode(.monochrome)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .bold))
                }
            }
            
            Button {
                showWebView.toggle()
            } label: {
                Text(text)
                    .font(Fonts.KulimPark.light.swiftUIFont(size: 16))
                    .foregroundColor(.white)
                +
                Text(highlightedText)
                    .font(Fonts.KulimPark.light.swiftUIFont(size: 16))
                    .foregroundColor(Colors.redCustom.swiftUIColor)
            }
        }
        .sheet(isPresented: $showWebView) {
            WebView(url: url)
        }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BackgroundGradientView()
            
            CheckBoxView(text: "Zgadzam sie z ",
                         highlightedText: "polityka prywatnosci",
                         url: nil) { _ in }
                .previewLayout(.sizeThatFits)
            .padding()
        }
    }
}
