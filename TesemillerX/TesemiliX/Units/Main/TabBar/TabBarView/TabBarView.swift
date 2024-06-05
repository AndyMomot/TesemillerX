//
//  TabBarView.swift
//  Mastenirby
//
//  Created by Andrii Momot on 02.05.2024.
//

import SwiftUI

struct TabBarView: View {
    @Binding var selectedItem: Int
    
    @State private var items: [TabBar.Item] = [
        .init(image: .init(systemName: "person.circle.fill")),
        .init(image: Asset.homeTab.swiftUIImage),
        .init(image: .init(systemName: "list.clipboard.fill")),
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
                                    if index == 0 {
                                        item.image
                                            .resizable()
                                            .scaledToFill()
                                            .clipShape(Circle())
                                            .foregroundStyle(.white)
                                            .frame(width: 28, height: 28)
                                        
                                    } else {
                                        item.image
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundStyle(.white)
                                            .frame(width: 24, height: 24)
                                    }
                                }
                        }
                    }
                }
            }
            .frame(height: UIScreen.main.bounds.height * 0.06)
            .onAppear {
                getProfileImage()
            }
    }
}

private extension TabBarView {
    func getProfileImage() {
        guard let userProfile = DefaultsService.getProfiles().first(where: { $0.isUser }) else { return }
        
        let path = FileManagerService.Keys.profileImage(id: userProfile.id).path
        
        if let data = FileManagerService().getFile(forPath: path),
           let uiImage = UIImage(data: data) {
            items[0].image = Image(uiImage: uiImage)
        }
    }
}

#Preview {
    TabBarView(selectedItem: .constant(0))
        .frame(width: 373, height: 52)
}
