//
//  CreateBudgetView.swift
//  TesemillerX
//
//  Created by Andrii Momot on 23.05.2024.
//

import SwiftUI

struct CreateBudgetView: View {
    @StateObject private var viewModel = CreateBudgetViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
                .ignoresSafeArea(edges: .bottom)
            
            VStack(spacing: 40) {
                ScrollView(showsIndicators: false) {
                    
                    HStack(spacing: 20) {
                        
                        Button {
                            withAnimation {
                                dismiss.callAsFunction()
                            }
                        } label: {
                            Image(systemName: "arrow.left")
                                .foregroundStyle(.white)
                                .font(Fonts.KulimPark.regular.swiftUIFont(size: 35))
                        }
                        
                        Text("Tworzenie budżetu")
                            .foregroundStyle(.white)
                            .font(Fonts.KulimPark.bold.swiftUIFont(size: 24))
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    
                    AddMemberView() { selectedProfiles in
                        viewModel.setProfiles(selectedProfiles)
                    }
                    
                    VStack(spacing: 14) {
                        InputFieldView(placeholder: "Nazwa kolekcji",
                                       rightView: EmptyView(),
                                       text: $viewModel.name)
                        .frame(height: 50)
                        
                        InputFieldView(placeholder: "Data realizacji ",
                                       rightView:
                                        Image(systemName: "calendar")
                            .renderingMode(.template)
                            .foregroundStyle(.white)
                                       ,
                                       canEdit: false,
                                       text: $viewModel.dateString) { // on right image
                            withAnimation {
                                viewModel.showDatePicker.toggle()
                            }
                        }
                                       .frame(height: 50)
                        
                        InputFieldResizable(placeholder: "Opis",
                                            text: $viewModel.description)
                        .frame(minHeight: 150)
                        
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
                        
                    }
                    .padding()
                    .background(Colors.grayMiddle.swiftUIColor)
                    .cornerRadius(10, corners: .allCorners)
                }
                
                Button {
                    viewModel.createBudget {
                        dismiss.callAsFunction()
                    }
                    
                } label: {
                    RoundedRectangle(cornerRadius: 24)
                        .foregroundStyle(Color.white)
                        .frame(height: 48)
                        .overlay {
                            HStack {
                                Image(systemName: "arrow.left")
                                    .opacity(.zero)
                                Spacer()
                                Text("Akceptuj")
                                Spacer()
                                Image(systemName: "arrow.right")
                            }
                            .foregroundStyle(Colors.blackCustom.swiftUIColor)
                            .font(Fonts.KulimPark.regular.swiftUIFont(size: 15))
                            .padding(.horizontal)
                        }
                        .padding(.horizontal, 80)
                }
                
                Spacer()
            }
            .onTapGesture {
                withAnimation {
                    hideKeyboard()
                }
            }
            
            // DatePicker
            if viewModel.showDatePicker {
                ZStack {
                    Colors.grayMiddle.swiftUIColor
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                viewModel.showDatePicker.toggle()
                            }
                        }
                    
                    DatePicker("",
                               selection: $viewModel.date,
                               in: Date()...,
                               displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .preferredColorScheme(.dark)
                    .padding()
                    .onChange(of: viewModel.date) { newValue in
                        viewModel.updateDateString(with: newValue)
                        withAnimation {
                            viewModel.showDatePicker.toggle()
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    ZStack {
        BackgroundGradientView()
        
        CreateBudgetView()
    }
}
