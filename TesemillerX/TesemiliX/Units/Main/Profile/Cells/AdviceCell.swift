//
//  AdviceCell.swift
//  TesemiliX
//
//  Created by Andrii Momot on 04.06.2024.
//

import SwiftUI

struct AdviceCell: View {
    var item: ProfileView.ProfileViewModel.Advice
    
    var body: some View {
        Image(item.previewImage)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay {
                VStack(alignment: .leading) {
                    HStack {
                        Text(item.title)
                            .foregroundStyle(.white)
                            .font(Fonts.KulimPark.bold.swiftUIFont(size: 24))
                            .multilineTextAlignment(.leading)
                            .shadow(radius: 10)
                        Spacer()
                    }
                    Spacer()
                }
                .padding()
            }
    }
}

#Preview {
    AdviceCell(
        item: .init(
            previewImage: "Rectangle29",
            mainImage: "Rectangle34",
            title: "Kupno domu",
            text: ""))
    .frame(width: 185, height: 163)
}
