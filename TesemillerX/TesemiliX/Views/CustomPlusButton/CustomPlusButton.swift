//
//  CustomPlusButton.swift
//  TesemillerX
//
//  Created by Andrii Momot on 23.05.2024.
//

import SwiftUI

struct CustomPlusButton: View {
    
    var circleColor: Color
    var plusColor: Color
    var onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            Circle()
                .foregroundStyle(circleColor)
                .overlay {
                    Image(systemName: "plus")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(plusColor)
                        .padding()
                }
        }
        

    }
}

#Preview {
    CustomPlusButton(
        circleColor: Colors.grayCustom.swiftUIColor,
        plusColor: Color.white) {
            // on tap
        }
        .frame(width: 48)
}
