//
//  AddMemberView.swift
//  TesemillerX
//
//  Created by Andrii Momot on 24.05.2024.
//

import SwiftUI

struct AddMemberView: View {
    @StateObject private var viewModel = AddMemberViewModel()
    var completedPercent: Double?
    var selectedProfiles: (([HomeView.HomeViewModel.Profile]) -> Void)?
    
    var body: some View {
        VStack(spacing: .zero) {
            let imageSize: CGFloat = 47
            
            // Plus button
            Rectangle()
                .foregroundStyle(Colors.grayMiddle.swiftUIColor)
                .frame(height: 66)
                .overlay {
                    HStack {
                        Button {
                            withAnimation {
                                viewModel.showAddPerson.toggle()
                                viewModel.getSavedProfiles()
                            }
                        } label: {
                            Circle()
                                .frame(width: imageSize,
                                       height: imageSize)
                                .foregroundStyle(.clear)
                                .overlay {
                                    let imageName = viewModel.showAddPerson ? "minus" : "plus"
                                    
                                    Image(systemName: imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundStyle(.white)
                                        .padding(12)
                                }
                        }
                        
                        // Profile image buttons
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(viewModel.selectedProfiles) { profile in
                                    if let image = viewModel.getProfileImage(for: profile.id) {
                                        
                                        Button {
                                            withAnimation {
                                                viewModel.removeProfileFromStack(profile: profile.id)
                                            }
                                        } label: {
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: imageSize,
                                                       height: imageSize)
                                                .clipShape(Circle())
                                        }
                                        
                                    }
                                }
                            }
                        }
                        
                        Spacer()
                        
                        if let percent = completedPercent {
                            Text(percent.string(maximumFractionDigits: 0) + "%")
                                .foregroundStyle(Colors.greenCustom.swiftUIColor)
                                .font(Fonts.KulimPark.bold.swiftUIFont(size: 32))
                        }
                    }
                    .padding()
                }
            
            // Add a persone
            
            if viewModel.showAddPerson {
                
                VStack {
                    
                    // Search
                    HStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundStyle(.white)
                            .frame(height: 49)
                            .overlay {
                                HStack {
                                    Asset.searchWhite.swiftUIImage
                                        .renderingMode(.template)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 22, height: 22)
                                        .foregroundStyle(Colors.grayMiddle.swiftUIColor).opacity(0.5)
                                    
                                    
                                    TextField(text: $viewModel.searchText) {
                                        Text("Szukaj")
                                    }
                                    .foregroundStyle(Colors.blackCustom.swiftUIColor)
                                    .font(Fonts.KulimPark.regular.swiftUIFont(size: 14))
                                }
                                .padding()
                            }
                    }
                    .padding()
                    
                    // Profile list
                    List {
                        ForEach(viewModel.savedProfiles) { profile in
                            PersonCell(profile: profile)
                                .onTapGesture {
                                    withAnimation {
                                        viewModel.addSelected(profile: profile)
                                    }
                                    selectedProfiles?(viewModel.getSelectedProfiles())
                                }
                        }
                        .onDelete(perform: viewModel.deleteItem)
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(PlainListStyle())
                    .frame(minHeight: 150)
                    
                    // Add profile button
                    Button {
                        viewModel.showCreatePerson.toggle()
                    } label: {
                        HStack {
                            Spacer()
                            
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                                .frame(width: 22)
                                .padding()
                            
                            Spacer()
                        }
                        .background(Colors.grayMiddle.swiftUIColor)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .padding(.horizontal, 60)
                    }
                    .padding()
                }
                .background(
                    Rectangle()
                        .foregroundStyle(Colors.grayLite.swiftUIColor)
                        .cornerRadius(30,
                                      corners: [.bottomLeft,
                                                .bottomRight])
                )
            }
        }
        .sheet(isPresented: $viewModel.showCreatePerson) {
            CreatePersonView() {
                withAnimation {
                    viewModel.getSavedProfiles()
                }
            }
        }
        .onChange(of: viewModel.searchText) { newValue in
            withAnimation {
                viewModel.filterProfiles()
            }
        }
    }
}

#Preview {
    AddMemberView()
}
