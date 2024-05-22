//
//  TabBarView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 02.05.2024.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedItem: Int
    
    private let items: [TabBar.Item] = [
        .init(image: .init(systemName: "person.circle.fill")),
        .init(image: Asset.homeTab.swiftUIImage),
        .init(image: Asset.notificationTab.swiftUIImage),
        .init(image: Asset.settingsTab.swiftUIImage)
        
    ]
    
    var body: some View {
        let tabIndices = Array(0..<items.count)
        
        RoundedRectangle(cornerRadius: 24)
            .foregroundStyle(Colors.grayMiddle.swiftUIColor)
            .overlay {
                HStack {
                    ForEach(tabIndices, id: \.self) { index in
                        let item = items[index]
                        let current = selectedItem == index
                        
                        Button {
                            selectedItem = index
                        } label: {
                            RoundedRectangle(cornerRadius: 24)
                                .foregroundStyle(
                                    current ? Colors.blackCustom.swiftUIColor : .clear
                                )
                                .overlay {
                                    item.image
                                        .renderingMode(.template)
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundStyle(.white)
                                        .frame(width: 24, height: 24)
                                        .padding(.horizontal)
                                }
                        }
                    }
                }
            }
    }
}

#Preview {
    TabBarView(selectedItem: .constant(0))
        .frame(width: 373, height: 52)
}
