//
//  TopUpBudgetView.swift
//  TesemiliX
//
//  Created by Andrii Momot on 03.06.2024.
//

import SwiftUI

struct TopUpBudgetView: View {
    var budgetId: String
    var onSave: () -> Void
    
    @StateObject private var viewModel = TopUpBudgetViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
                .ignoresSafeArea()
            
            VStack(spacing: 28) {
                
                if let selectedProfile = viewModel.selectedProfile,
                   let image = viewModel.getProfileImage(for: selectedProfile.id) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: 8) {
                        ForEach(viewModel.savedProfiles) { profile in
                            if let image = viewModel.getProfileImage(for: profile.id) {
                                Button {
                                    viewModel.selectedProfile = profile
                                } label: {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                }
                            }
                        }
                    }
                }
                
                // Amount
                HStack(spacing: 4) {
                    Text("$")
                    
                    TextField(text: $viewModel.amount) {
                        Text("0")
                            .foregroundStyle(.white)
                            .font(Fonts.KulimPark.regular.swiftUIFont(size: 32))
                    }
                    .keyboardType(.numberPad)
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .foregroundStyle(.white)
                .font(Fonts.KulimPark.regular.swiftUIFont(size: 32))
                .background {
                    Colors.greenCustom.swiftUIColor
                }
                .cornerRadius(10, corners: .allCorners)
                
                Button {
                    viewModel.topUpBudget {
                        onSave()
                        dismiss.callAsFunction()
                    }
                } label: {
                    RoundedRectangle(cornerRadius: 24)
                        .foregroundStyle(Color.white)
                        .frame(height: 48)
                        .overlay {
                            HStack {
                                Image(systemName: "arrow.left")
                                
                                Spacer()
                                Text("Ratować")
                                Spacer()
                                Image(systemName: "arrow.right")
                                    .opacity(.zero)
                            }
                            .foregroundStyle(Colors.blackCustom.swiftUIColor)
                            .font(Fonts.KulimPark.regular.swiftUIFont(size: 15))
                            .padding(.horizontal)
                        }
                        .padding(.horizontal, 80)
                }
                
                Spacer()
            }
            .padding()
            .onAppear {
                viewModel.budgetId = self.budgetId
                viewModel.getSavedProfiles()
            }
        }
    }
}

#Preview {
    TopUpBudgetView(budgetId: "") {}
}
