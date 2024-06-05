//
//  ProfileView.swift
//  TesemiliX
//
//  Created by Andrii Momot on 04.06.2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundGradientView()
                    .ignoresSafeArea()
                
                VStack(spacing: 33) {
                    HStack(spacing: 16) {
                        viewModel.getProfileImage()
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 69, height: 69)
                        
                        VStack(alignment: .leading) {
                            Text(viewModel.profile.firstName)
                            Text(viewModel.profile.lastName)
                        }
                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                        .font(Fonts.KulimPark.bold.swiftUIFont(size: 18))
                        .minimumScaleFactor(0.5)
                        
                        Divider()
                            .frame(height: 59)
                        
                        VStack(alignment: .leading) {
                            Text("Twój wkład")
                                .foregroundStyle(.black)
                                .font(Fonts.KulimPark.regular.swiftUIFont(size: 9))
                            
                            Text("$" + viewModel.amount.string(maximumFractionDigits: 0))
                                .foregroundStyle(Colors.greenCustom.swiftUIColor)
                                .font(Fonts.KulimPark.bold.swiftUIFont(size: 20))
                                .minimumScaleFactor(0.5)
                        }
                        
                        Spacer()
                        
                        Button {
                            viewModel.showCreatePerson.toggle()
                        } label: {
                            Image(systemName: "pencil")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.black)
                                .font(Fonts.KulimPark.bold.swiftUIFont(size: 18))
                        }

                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 33)  {
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("Twój asystent ds.")
                                        .foregroundStyle(.white)
                                        .font(Fonts.KulimPark.bold.swiftUIFont(fixedSize: 24))
                                    Text("oszczędności")
                                        .foregroundStyle(Colors.redCustom.swiftUIColor)
                                        .font(Fonts.KulimPark.bold.swiftUIFont(fixedSize: 24))
                                    
                                    Text("Tutaj możesz dowiedzieć się, jak prawidłowo oszczędzać na określone potrzeby")
                                        .foregroundStyle(.white)
                                        .font(Fonts.KulimPark.extraLight.swiftUIFont(fixedSize: 13))
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                            
                            LazyVGrid(columns: [GridItem(.flexible(), 
                                                         spacing: 22),
                                                GridItem(.flexible(), 
                                                         spacing: 0)],
                                      spacing: 22) {
                                ForEach(viewModel.advices) { item in
                                    Button {
                                        viewModel.adviceToShow = item
                                        withAnimation {
                                            viewModel.showAdviceDetails = true
                                        }
                                    } label: {
                                        AdviceCell(item: item)
                                    }
                                }
                            }
                                      .padding(.horizontal)
                        }
                    }
                    .refreshable {
                        viewModel.showAdviceDetails = false
                        viewModel.getProfile()
                        viewModel.getAmount()
                    }
                }
                .padding(.bottom, UIScreen.main.bounds.height * 0.01)
            }
            .navigationDestination(isPresented: $viewModel.showAdviceDetails) {
                AdviceDetailsView(item: viewModel.adviceToShow)
            }
            .sheet(isPresented: $viewModel.showCreatePerson) {
                CreatePersonView(profile: viewModel.profile) {
                    viewModel.getProfile()
                }
            }
            .onAppear {
                viewModel.showAdviceDetails = false
                viewModel.getProfile()
                viewModel.getAmount()
            }
        }
    }
}

#Preview {
    ProfileView()
}
