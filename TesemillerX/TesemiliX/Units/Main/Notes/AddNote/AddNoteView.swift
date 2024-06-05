//
//  AddNoteView.swift
//  TesemiliX
//
//  Created by Andrii Momot on 05.06.2024.
//

import SwiftUI

struct AddNoteView: View {
    @StateObject private var viewModel = AddNoteViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var onDismiss: () -> Void
    
    var body: some View {
        ZStack {
            BackgroundGradientView()
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 30) {
                    InputFieldView(
                        placeholder: "Tytuł",
                        rightView: EmptyView(),
                        text: $viewModel.title)
                    .frame(height: 44)
                    
                    InputFieldResizable(
                        placeholder: "Tekst",
                        text: $viewModel.text
                    )
                    .frame(minHeight: 150)
                    
                    Button {
                        viewModel.saveNote {
                            dismiss.callAsFunction()
                            onDismiss()
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: 24)
                            .foregroundStyle(Colors.greenCustom.swiftUIColor)
                        .frame(height: 48)
                        .overlay {
                            HStack {
                                Spacer()
                                Text("Ratować")
                                Spacer()
                            }
                            .foregroundStyle(.white)
                            .font(Fonts.KulimPark.bold.swiftUIFont(size: 16))
                            .padding(.horizontal)
                        }
                        .padding(.horizontal, 80)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    AddNoteView() {}
}
