//
//  CreateBudgetView.swift
//  TesemillerX
//
//  Created by Andrii Momot on 23.05.2024.
//

import SwiftUI

struct CreateBudgetView: View {
    @Binding var name: String
    @Binding var date: Date
    @Binding var description: String
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Tworzenie budżetu")
                    .foregroundStyle(.white)
                    .font(Fonts.KulimPark.bold.swiftUIFont(size: 24))
                Spacer()
            }
            .padding(.horizontal)
            
            Rectangle()
                .foregroundStyle(Colors.grayMiddle.swiftUIColor)
                .frame(height: 66)
                .overlay {
                    HStack(spacing: 16) {
                        ForEach(0..<4) { index in
                            CustomPlusButton(
                                circleColor: Colors.grayCustom.swiftUIColor,
                                plusColor: Color.white) {
                                    // on tap
                                }
                                .frame(width: 48)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            
            VStack(spacing: 14) {
                InputFieldView(placeholder: "Nazwa kolekcji",
                               text: $name)
                .frame(height: 50)
                
                InputFieldView(placeholder: "Nazwa kolekcji",
                               rightImage: Image(systemName: "calendar"),
                               text: $name)
                .frame(height: 50)
            }
            .cornerRadius(10, corners: .allCorners)
            .padding()
            .background(Colors.grayMiddle.swiftUIColor)
           
            
            Button {
                
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
    }
}

#Preview {
    ZStack {
        BackgroundGradientView()
        
        CreateBudgetView(name: .constant("Name"),
                         date: .constant(.init()),
                         description: .constant(""))
    }
}
