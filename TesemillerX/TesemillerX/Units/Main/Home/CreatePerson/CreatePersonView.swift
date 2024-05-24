//
//  CreatePersonView.swift
//  TesemillerX
//
//  Created by Andrii Momot on 24.05.2024.
//

import SwiftUI

struct CreatePersonView: View {
    @StateObject private var viewModel = CreatePersonViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    viewModel.selectedImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                    
                    Button {
                        viewModel.showImagePicker.toggle()
                    } label: {
                        Text("Wybierz zdjęcie")
                            .underline()
                            .foregroundStyle(Colors.blueCustom.swiftUIColor)
                            .font(Fonts.KulimPark.bold.swiftUIFont(size: 22))
                    }
                    
                }
                
                VStack {
                    InputFieldView(placeholder: "Imię",
                                   text: $viewModel.firstName)
                    .frame(height: 48)
                    
                    InputFieldView(placeholder: "Nazwisko",
                                   text: $viewModel.lastName)
                    .frame(height: 48)
                }
            }
            
            Spacer()
            
            // Add profile button
            Button {
                
            } label: {
                HStack {
                    Spacer()
                    Text("Ratować")
                        .foregroundStyle(.white)
                        .font(Fonts.KulimPark.bold.swiftUIFont(size: 18))
                        .padding(
                        )
                    Spacer()
                }
                .background(Colors.grayMiddle.swiftUIColor)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .padding(.horizontal, 60)
            }
        }
        .padding()
        .sheet(isPresented: $viewModel.showImagePicker) {
            ImagePicker(selectedImage: $viewModel.selectedImage)
        }
    }
}

#Preview {
    CreatePersonView()
}
