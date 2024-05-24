//
//  PersonCell.swift
//  TesemillerX
//
//  Created by Andrii Momot on 24.05.2024.
//

import SwiftUI

struct PersonCell: View {
    var profile: HomeView.HomeViewModel.Profile
    
    @State private var image: Image = .init(systemName: "person.circle.fill")
    
    var body: some View {
        HStack(spacing: 22) {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 51)
                .clipShape(Circle())
            
            Text("\(profile.firstName) \(profile.lastName)")
                .foregroundStyle(Colors.grayMiddle.swiftUIColor)
                .font(Fonts.KulimPark.bold.swiftUIFont(size: 18))
            
            Spacer()
        }
        .background(.white)
        .cornerRadius(25, corners: .allCorners)
        .onAppear {
            DispatchQueue.main.async {
                if let image = getProfileImage(for: profile.id) {
                    self.image = image
                }
            }
        }
    }
}

extension PersonCell {
    func getProfileImage(for id: String) -> Image? {
        let path = "profileImage/\(id)"
        guard let data = FileManagerService().getFile(forPath: path),
              let uiImage = UIImage(data: data)
        else {
            return nil
        }
        
        return Image(uiImage: uiImage)
    }
}

#Preview {
    
    ZStack {
        Colors.grayLite.swiftUIColor
        PersonCell(profile: .init(
            firstName: "Firstname",
            lastName: "Lastname")
        )
    }
}
