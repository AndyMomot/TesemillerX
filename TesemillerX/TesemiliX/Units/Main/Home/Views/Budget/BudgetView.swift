//
//  BudgetView.swift
//  TesemiliX
//
//  Created by Andrii Momot on 28.05.2024.
//

import SwiftUI

struct BudgetView: View {
    var model: CreateBudgetView.BudgetModel
    
    @State private var progress: Double = 0
    @State private var amount: Double = 0
    
    var body: some View {
        VStack(spacing: 0) {
            AddMemberView(completedPercent: progress)
            
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
                    amount: amount
                )
                .padding(.horizontal, 40)
            }
            .background(.white)
            .cornerRadius(50,
                          corners: [.bottomLeft, .bottomRight])
            
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
        DispatchQueue.main.async {
            self.progress = 40 // (model.completed / model.amount) * 100
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
            amount: 10_00
        ))
        .padding()
    }
}
