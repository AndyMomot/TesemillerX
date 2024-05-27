//
//  BackgroundGradientView.swift
//  TesemillerX
//
//  Created by Andrii Momot on 17.05.2024.
//

import SwiftUI

struct BackgroundGradientView: View {
    var body: some View {
        LinearGradient(colors: [
            Color(.init(red: 30/255,
                        green: 41/255,
                        blue: 57/255,
                        alpha: 1)),
            
            Color(.init(red: 79/255,
                        green: 91/255,
                        blue: 111/255,
                        alpha: 1))
        ], startPoint: .top, endPoint: .bottom)
    }
}

#Preview {
    BackgroundGradientView()
}
