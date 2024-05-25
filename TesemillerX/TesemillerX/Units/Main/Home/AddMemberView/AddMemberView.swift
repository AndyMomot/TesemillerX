//
//  AddMemberView.swift
//  TesemillerX
//
//  Created by Andrii Momot on 24.05.2024.
//

import SwiftUI

struct AddMemberView: View {
    @StateObject private var viewModel = AddMemberViewModel()
    
    var body: some View {
        VStack(spacing: .zero) {
            Rectangle()
                .foregroundStyle(Colors.grayMiddle.swiftUIColor)
                .frame(height: 66)
                .overlay {
                    HStack {
                        let imageSize: CGFloat = 47
                        
                        // Profile image buttons
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
                        
                        // Plus button
                        if viewModel.selectedProfiles.count < 4 {
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
                                        Image(systemName: "plus")
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundStyle(.white)
                                            .padding(12)
                                    }
                            }
                        }
                        
                        Spacer()
                        
                        if let percent = viewModel.completedPercent {
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
                                TextField(text: $viewModel.searchText) {
                                    Text("Szukaj")
                                }
                                .foregroundStyle(Colors.blackCustom.swiftUIColor)
                                .font(Fonts.KulimPark.regular.swiftUIFont(size: 14))
                                .padding()
                            }
                        
                        Button {
                            
                        } label: {
                            Asset.searchWhite.swiftUIImage
                                .resizable()
                                .scaledToFit()
                                .frame(height: 22)
                                .padding(.horizontal, 30)
                                .padding(.vertical)
                                .background {
                                    RoundedRectangle(cornerRadius: 25.0)
                                        .foregroundStyle(Colors.grayMiddle.swiftUIColor)
                                }
                        }
                    }
                    .padding()
                    
                    // Profile list
                    List {
                        ForEach(viewModel.savedProfiles) { profile in
                            PersonCell(profile: profile)
                        }
                        .listRowBackground(Color.clear)
                    }
                    .listStyle(PlainListStyle())
                    
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
            CreatePersonView()
        }
    }
}

#Preview {
    AddMemberView()
}
