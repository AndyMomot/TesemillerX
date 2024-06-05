//
//  SettingCell.swift
//  TesemiliX
//
//  Created by Andrii Momot on 05.06.2024.
//

import SwiftUI

struct SettingCell: View {
    var item: SettingsView.Item
    
    var body: some View {
        HStack(spacing: 40) {
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 34, height: 34)
            
            Text(item.title)
                .foregroundStyle(.white)
                .font(Fonts.KulimPark.semiBold.swiftUIFont(size: 16))
            
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        BackgroundGradientView()
        
        SettingCell(item: .editProfile)
    }
}
