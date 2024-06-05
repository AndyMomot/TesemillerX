//
//  DepositProgressView.swift
//  TesemillerX
//
//  Created by Andrii Momot on 22.05.2024.
//

import SwiftUI

struct DepositProgressView: View {
    var totalAmount: Double
    var myAmount: Double
    var percent = 0.0
    
    @State var colors: [Color] = [
        Colors.grayCustom.swiftUIColor,
        Colors.grayCustom.swiftUIColor,
        Colors.grayCustom.swiftUIColor,
        Colors.grayCustom.swiftUIColor
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .bottom) {
                
                Text("$" + myAmount.string(maximumFractionDigits: 0))
                    .foregroundStyle(.white)
                    .font(Fonts.KulimPark.regular.swiftUIFont(size: 45))
                Spacer()
                
                Text("Twój wkład")
                    .foregroundStyle(.white)
                    .font(Fonts.KulimPark.regular.swiftUIFont(size: 15))
            }
            
            HStack(spacing: 8) {
                ForEach(0..<4) { index in
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundStyle(colors[index])
                        .frame(height: 8)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.async {
//                self.calculatePercent()
                self.updateColors()
            }
        }
    }
}

private extension DepositProgressView {
//    func calculatePercent() {
//        if totalAmount > 0 && myAmount >= 0 {
//            percent = (myAmount / totalAmount) * 100.0
//        } else {
//            percent = 0.0
//        }
//        
//        updateColors()
//    }
    
    func updateColors() {
        switch percent {
        case 1...25:
            colors = [
                Colors.greenCustom.swiftUIColor,
                Colors.grayCustom.swiftUIColor,
                Colors.grayCustom.swiftUIColor,
                Colors.grayCustom.swiftUIColor
            ]
            
        case 26...50:
            colors = [
                Colors.greenCustom.swiftUIColor,
                Colors.greenCustom.swiftUIColor,
                Colors.grayCustom.swiftUIColor,
                Colors.grayCustom.swiftUIColor
            ]
            
        case 51...75:
            colors = [
                Colors.greenCustom.swiftUIColor,
                Colors.greenCustom.swiftUIColor,
                Colors.greenCustom.swiftUIColor,
                Colors.grayCustom.swiftUIColor
            ]
        case 76...:
            colors = [
                Colors.greenCustom.swiftUIColor,
                Colors.greenCustom.swiftUIColor,
                Colors.greenCustom.swiftUIColor,
                Colors.greenCustom.swiftUIColor
            ]
        default:
            colors = [
                Colors.grayCustom.swiftUIColor,
                Colors.grayCustom.swiftUIColor,
                Colors.grayCustom.swiftUIColor,
                Colors.grayCustom.swiftUIColor
            ]
        }
    }
}

#Preview {
    ZStack {
        BackgroundGradientView()
        
        DepositProgressView(
            totalAmount: 3000,
            myAmount: 1200)
    }
}
