//
//  DonnaterCell.swift
//  TesemiliX
//
//  Created by Andrii Momot on 03.06.2024.
//

import SwiftUI

struct DonnaterCell: View {
    var contribution: CreateBudgetView.BudgetModel.Contribution
    var onDelete: (_ id: String) -> Void
    
    @State var image = Image(systemName: "person.circle.fill")
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                HStack {
                    image
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 47, height: 47)
                        .shadow(radius: 5, y: 5)
                    
                    VStack(alignment: .leading) {
                        Text("Uzupełniony.")
                            .foregroundStyle(.white)
                            .font(Fonts.KulimPark.light.swiftUIFont(size: 20))
                        
                        Text("$" + contribution.amount.string(maximumFractionDigits: 0))
                            .foregroundStyle(.white)
                            .font(Fonts.KulimPark.regular.swiftUIFont(size: 45))
                    }
                    .multilineTextAlignment(.leading)
                }
                
                Spacer()
                
                var dateString: String {
                    if contribution.date.isToday() {
                        return "Dzisiaj"
                    } else {
                        return contribution.date.toString(format: .ddMMyy)
                    }
                }
                
                HStack(spacing: 20) {
                    Text(dateString)
                        .foregroundStyle(.white)
                        .font(Fonts.KulimPark.regular.swiftUIFont(size: 13))
                    
                    Button {
                        onDelete(contribution.id)
                    } label: {
                        Image(systemName: "trash.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 26, height: 33)
                            .foregroundStyle(.white)
                    }
                }
            }
            
            Rectangle()
                .foregroundStyle(.black)
                .frame(height: 1)
        }
        .onAppear {
            if let image = getProfileImage(for: contribution.profile.id) {
                self.image = image
            }
        }
    }
}

private extension DonnaterCell {
    func getProfileImage(for id: String) -> Image? {
        let path = FileManagerService.Keys.profileImage(id: id).path
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
        BackgroundGradientView()
        
        DonnaterCell(contribution: .init(
            date: .init(),
            profile: .init(firstName: "Name", lastName: "Tester"),
            amount: 100
        )) { _ in }
    }
}
