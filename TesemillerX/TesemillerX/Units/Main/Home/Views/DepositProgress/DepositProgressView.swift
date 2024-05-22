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
    
    @State private var percent = 0.0
    
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
                        .foregroundStyle(colorFor(index: index))
                        .frame(height: 8)
                }
            }
        }
        .onAppear {
            calculatePercent()
        }
    }
}

private extension DepositProgressView {
    func calculatePercent() {
        percent = (myAmount / totalAmount) * 100.0
        print("percent", percent)
    }
    
    func colorFor(index: Int) -> Color {
        switch index {
        case 0:
            return colorFor(percent: 25)
        case 1:
            return colorFor(percent: 50)
        case 2:
            return colorFor(percent: 75)
        case 3:
            return colorFor(percent: 100)
        default:
            return Colors.grayCustom.swiftUIColor
        }
    }
    
    func colorFor(percent: Double) -> Color {
        if self.percent >= percent {
            return Colors.greenCustom.swiftUIColor
        } else {
            return Colors.grayCustom.swiftUIColor
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
