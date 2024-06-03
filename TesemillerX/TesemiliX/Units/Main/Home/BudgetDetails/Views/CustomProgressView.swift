//
//  CustomProgressView.swift
//  TesemiliX
//
//  Created by Andrii Momot on 03.06.2024.
//

import SwiftUI

struct CustomProgressView: View {
    var progress: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background track
                RoundedRectangle(cornerRadius: 28)
                    .fill(Color.white)
                    .frame(height: 56)
                
                // Progress bar
                RoundedRectangle(cornerRadius: 28)
                    .fill(Color.black)
                    .frame(width: geometry.size.width * CGFloat(self.progress), height: 56)
            }
            .frame(height: 56)
        }
        .frame(height: 56)
    }
}

#Preview {
    ZStack {
        Colors.greenCustom.swiftUIColor
        
        CustomProgressView(progress: 0.01)
    }
}
