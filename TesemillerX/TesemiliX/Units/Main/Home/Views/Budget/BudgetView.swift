//
//  BudgetView.swift
//  TesemiliX
//
//  Created by Andrii Momot on 28.05.2024.
//

import SwiftUI

struct BudgetView: View {
    var model: CreateBudgetView.BudgetModel
    var onDetails: () -> Void
    
    @State private var progress: Double = 0
    @State private var amount: Double = 0
    
    @State private var firstColor = Colors.greenCustom.swiftUIColor.opacity(0.2)
    @State private var secondColor = Colors.greenCustom.swiftUIColor.opacity(0.25)
    @State private var thirdColor = Colors.greenCustom.swiftUIColor.opacity(0.3)
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 10) {
                HStack {
                    Text(model.name)
                        .foregroundStyle(.white)
                        .font(Fonts.KulimPark.bold.swiftUIFont(size: 16))
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                AddMemberView(
                    completedPercent: progress,
                    profiles: model.profiles
                )
            }
            
            VStack {
                HStack {
                    Text(model.name)
                        .foregroundStyle(.black)
                        .font(Fonts.KulimPark.bold.swiftUIFont(size: 24))
                    
                    Spacer()
                    
                    if let date = model.date {
                        Text("Przed " + date.toString(format: .ddMMyyyy))
                            .foregroundStyle(.black)
                            .font(Fonts.KulimPark.bold.swiftUIFont(size: 13))
                    }
                }
                .padding()
                
                CircledProgressView(
                    progress: progress,
                    amount: amount,
                    firstColor: self.firstColor,
                    secondColor: self.secondColor,
                    thirdColor: self.thirdColor) { // On Details
                        onDetails()
                    }
                    .padding(.horizontal, 40)
            }
            .background(.white)
            .cornerRadius(50, corners: [.bottomLeft, .bottomRight])
            
            Spacer()
        }
        .onAppear {
            withAnimation {
                calculateProgress()
                amount = model.amount
            }
        }
    }
}

private extension BudgetView {
    func calculateProgress() {
        self.progress = (model.completed / model.amount) * 100
        
        switch progress {
        case 1...20:
            firstColor = Colors.greenCustom.swiftUIColor
            secondColor = Colors.greenCustom.swiftUIColor.opacity(0.25)
            thirdColor = Colors.greenCustom.swiftUIColor.opacity(0.3)
            
        case 21...80:
            firstColor = Colors.greenCustom.swiftUIColor
            secondColor = Colors.greenCustom.swiftUIColor
            thirdColor = Colors.greenCustom.swiftUIColor.opacity(0.25)
            
        case 81...:
            firstColor = Colors.greenCustom.swiftUIColor
            secondColor = Colors.greenCustom.swiftUIColor
            thirdColor = Colors.greenCustom.swiftUIColor
            
        default:
            firstColor = Colors.greenCustom.swiftUIColor.opacity(0.2)
            secondColor = Colors.greenCustom.swiftUIColor.opacity(0.25)
            thirdColor = Colors.greenCustom.swiftUIColor.opacity(0.3)
        }
    }
}

#Preview {
    ZStack {
        BackgroundGradientView()
        
        BudgetView(model: .init(
            profiles: [
                .init(firstName: "Test", lastName: "1"),
                .init(firstName: "Test", lastName: "2")
            ],
            name: "Hous",
            date: .init(),
            description: "Some description",
            amount: 1000
        )) {}
        .padding()
    }
}
