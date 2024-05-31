//
//  HomeView.swift
//  TesemillerX
//
//  Created by Andrii Momot on 22.05.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    @State var isActive = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundGradientView()
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        let currentMonth = Date().toString(format: .llll).capitalized
                        Text(currentMonth)
                            .foregroundStyle(Colors.blackCustom.swiftUIColor)
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background()
                            .cornerRadius(10, corners: .allCorners)
                        
                        Spacer()
                        
                        NavigationLink(destination: CreateBudgetView()) {
                            Text("Tworzenie budżetu")
                                .foregroundStyle(Colors.blackCustom.swiftUIColor)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 12)
                                .background()
                                .cornerRadius(10, corners: .allCorners)
                        }
                    }
                    .padding()
                    
                    ScrollView {
                        VStack {
                            DepositProgressView(
                                totalAmount: viewModel.totalAmount,
                                myAmount: viewModel.myAmount)
                            
                            Spacer(minLength: 50)
                            
                            VStack {
                                ForEach(viewModel.budgets) { budget in
                                    BudgetView(model: budget) { // on derails
                                        viewModel.budgetToShow = budget
                                        if let budget = viewModel.budgetToShow {
                                            self.viewModel.showBudgetDetails.toggle()
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .navigationDestination(
                    isPresented: $viewModel.showBudgetDetails) {
                        Text(viewModel.budgetToShow?.name ?? "Name")
                     }
            }
            .onAppear {
                viewModel.onAppear()
            }
            
        }
    }
}

#Preview {
    HomeView()
}
