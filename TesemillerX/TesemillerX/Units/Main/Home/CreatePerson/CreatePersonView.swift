//
//  CreatePersonView.swift
//  TesemillerX
//
//  Created by Andrii Momot on 24.05.2024.
//

import SwiftUI

struct CreatePersonView: View {
    var onDismiss: () -> Void
    
    @StateObject private var viewModel = CreatePersonViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    Image(uiImage: viewModel.selectedImage)
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
                                   rightView: EmptyView(),
                                   text: $viewModel.firstName)
                    .frame(height: 48)
                    
                    InputFieldView(placeholder: "Nazwisko",
                                   rightView: EmptyView(),
                                   text: $viewModel.lastName)
                    .frame(height: 48)
                }
            }
            
            Spacer()
            
            // Add profile button
            Button {
                viewModel.savePerson {
                    dismiss.callAsFunction()
                    onDismiss()
                }
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
    CreatePersonView() {}
}
