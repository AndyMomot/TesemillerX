//
//  BudgetDetailsView.swift
//  TesemiliX
//
//  Created by Andrii Momot on 31.05.2024.
//

import SwiftUI

struct BudgetDetailsView: View {
    var budget: CreateBudgetView.BudgetModel
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = BudgetDetailsViewModel()
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                HStack {
                    Button {
                        dismiss.callAsFunction()
                    } label: {
                        Circle()
                            .frame(width: 45, height: 45)
                            .foregroundStyle(.black)
                            .overlay {
                                Image(systemName: "arrow.left")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.white)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 9)
                            }
                    }
                    .padding()

                    Spacer()
                    
                    Button {
                        // Delete action
                    } label: {
                        Rectangle()
                            .foregroundStyle(.white)
                            .frame(height: 50)
                            .frame(maxWidth: 96)
                            .cornerRadius(25, corners: [.topLeft, .bottomLeft])
                            .overlay {
                                HStack {
                                    Spacer()
                                    
                                    Image(systemName: "trash.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 26, height: 33)
                                        .foregroundStyle(.black)
                                        .padding(.trailing)
                                }
                            }
                    }
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Opis")
                        .foregroundStyle(.black)
                        .font(Fonts.KulimPark.regular.swiftUIFont(size: 20))
                    
                    Text(budget.description)
                        .foregroundStyle(.white)
                        .font(Fonts.KulimPark.regular.swiftUIFont(size: 12))
                    
                }
                .padding(.horizontal, 30)
                .multilineTextAlignment(.leading)
                
                VStack(spacing: 10) {
                    HStack {
                        Text(budget.percent.string(maximumFractionDigits: 0) + "%")
                            .foregroundStyle(.black)
                            .font(Fonts.KulimPark.bold.swiftUIFont(size: 40))
                        Spacer()
                        Text(budget.name)
                            .foregroundStyle(.black)
                            .font(Fonts.KulimPark.bold.swiftUIFont(size: 24))
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 28)
                            .foregroundStyle(.white)
                            .frame(height: 56)
                        
                        HStack {
                            
                            RoundedRectangle(cornerRadius: 28)
                                .foregroundStyle(Colors.blackCustom.swiftUIColor)
                                .frame(height: 56)
                            
                            Spacer(minLength: viewModel.progressRightPadding)
                        }
                    }
                }
                .padding(.horizontal, 30)
                .padding(.bottom)
            }
            .background(Colors.greenCustom.swiftUIColor)
            .cornerRadius(50, corners: [.bottomLeft, .bottomRight])
        }
        .onAppear {
            withAnimation {
                let width = UIScreen.main.bounds.width
                viewModel.calculateProgressWith(screen: width, budget: budget)
            }
        }
    }
}

#Preview {
    BudgetDetailsView(
        budget: .init(
            profiles: [
                .init(firstName: "Test", lastName: "1"),
                .init(firstName: "Test", lastName: "2")
            ],
            name: "Car",
            description: "Rodzina zbiera pieniądze na edukację, aby zapewnić swoim dzieciom wysokiej jakości edukację i rozwój. Rozumieją, że edukacja jest kluczem do przyszłego sukcesu i szczęśliwego życia. Zbierając fundusze na edukację, rodzina dąży do zapewnienia dzieciom dostępu do najlepszych możliwości nauki, rozwijając ich potencjał i pomagając im zbudować udaną karierę.",
            amount: 15_000,
            completed: 6_000
        )
    )
}
