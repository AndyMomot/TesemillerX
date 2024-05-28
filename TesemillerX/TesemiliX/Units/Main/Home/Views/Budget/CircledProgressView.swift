//
//  CircledProgressView.swift
//  TesemiliX
//
//  Created by Andrii Momot on 28.05.2024.
//

import SwiftUI

struct CircledProgressView: View {
    var progress: Double
    var amount: Double
    
    @State private var firstColor = Colors.greenCustom.swiftUIColor.opacity(0.1)
    @State private var secondColor = Colors.greenCustom.swiftUIColor.opacity(0.15)
    @State private var thirdColor = Colors.greenCustom.swiftUIColor.opacity(0.2)
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                Circle()
                    .stroke(firstColor, lineWidth: 20)
                    .background(Circle().fill(Color.clear))
                    .clipShape(SemiCircleMask(
                        start: -180,
                        end: -140
                    ))
                
                Circle()
                    .stroke(secondColor, lineWidth: 20)
                    .background(Circle().fill(Color.clear))
                    .clipShape(SemiCircleMask(
                        start: -134,
                        end: -46
                    ))
                
                Circle()
                    .stroke(thirdColor, lineWidth: 20)
                    .background(Circle().fill(Color.clear))
                    .clipShape(SemiCircleMask(
                        start: -40,
                        end: -0
                    ))
                
                Text("$" + amount.string(maximumFractionDigits: 0))
                    .foregroundStyle(Colors.blackCustom.swiftUIColor)
                    .font(Fonts.KulimPark.regular.swiftUIFont(fixedSize: 45))
                    .padding(.bottom, geometry.size.width / 2.5)
            }
        }
        .padding(.horizontal)
        .onAppear {
            DispatchQueue.main.async {
                withAnimation {
                    calculateProgress()
                }
            }
        }
        .onChange(of: progress) { value in
            DispatchQueue.main.async {
                withAnimation {
                    calculateProgress()
                }
            }
        }
    }
}

private extension CircledProgressView {
    func calculateProgress() {
        switch progress {
        case 1...20:
            firstColor = Colors.greenCustom.swiftUIColor
            secondColor = Colors.greenCustom.swiftUIColor.opacity(0.15)
            thirdColor = Colors.greenCustom.swiftUIColor.opacity(0.2)
            
        case 21...80:
            firstColor = Colors.greenCustom.swiftUIColor
            secondColor = Colors.greenCustom.swiftUIColor
            thirdColor = Colors.greenCustom.swiftUIColor.opacity(0.2)
            
        case 81...:
            firstColor = Colors.greenCustom.swiftUIColor
            secondColor = Colors.greenCustom.swiftUIColor
            thirdColor = Colors.greenCustom.swiftUIColor
            
        default:
            firstColor = Colors.greenCustom.swiftUIColor.opacity(0.1)
            secondColor = Colors.greenCustom.swiftUIColor.opacity(0.15)
            thirdColor = Colors.greenCustom.swiftUIColor.opacity(0.2)
        }
    }
}

private struct SemiCircleMask: Shape {
    var start: Double
    var end: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height)
        
        path.addArc(
            center: center,
            radius: radius,
            startAngle: .degrees(start),
            endAngle: .degrees(end),
            clockwise: false)
        
        path.addLine(to: center)
        path.closeSubpath()
        
        return path
    }
}

#Preview {
    CircledProgressView(
        progress: 50,
        amount: 1400
    )
}
