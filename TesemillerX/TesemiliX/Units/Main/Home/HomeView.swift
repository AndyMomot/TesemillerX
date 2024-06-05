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
                            .background(Colors.grayCustom.swiftUIColor)
                            .cornerRadius(10, corners: .allCorners)
                        
                        Spacer()
                        
                        Button {
                            viewModel.showCreateBudget.toggle()
                        } label: {
                            Text("Tworzenie budżetu")
                                .foregroundStyle(Colors.blackCustom.swiftUIColor)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 12)
                                .background(Colors.grayCustom.swiftUIColor)
                                .cornerRadius(10, corners: .allCorners)
                        }
                    }
                    .padding()
                    
                    ScrollView(showsIndicators: false) {
                        VStack {
                            DepositProgressView(
                                totalAmount: viewModel.totalAmount,
                                myAmount: viewModel.myAmount,
                                percent: viewModel.calculatePercent()
                            )
                            
                            .padding(.horizontal)
                            
                            Spacer(minLength: 50)
                            
                            VStack {
                                ForEach(viewModel.budgets) { budget in
                                    BudgetView(model: budget) { // on derails
                                        viewModel.budgetToShow = budget
                                        self.viewModel.showBudgetDetails.toggle()
                                        
                                    }
                                }
                            }
                        }
                    }
                    .refreshable {
                        viewModel.onAppear()
                    }
                }
                .padding(.bottom, UIScreen.main.bounds.height * 0.01)
            }
            .onAppear {
                viewModel.onAppear()
            }
            .navigationDestination(isPresented: $viewModel.showCreateBudget) {
                CreateBudgetView()
            }
            .navigationDestination(isPresented: $viewModel.showBudgetDetails) {
                if let budget = viewModel.budgetToShow {
                    BudgetDetailsView(budget: budget) {
                        viewModel.onAppear()
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
