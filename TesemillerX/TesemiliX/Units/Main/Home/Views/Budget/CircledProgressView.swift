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
    
    var firstColor = Colors.greenCustom.swiftUIColor.opacity(0.2)
    var secondColor = Colors.greenCustom.swiftUIColor.opacity(0.25)
    var thirdColor = Colors.greenCustom.swiftUIColor.opacity(0.3)
    
    var onDetails: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(firstColor, lineWidth: 20)
                .background(Circle().fill(Color.clear))
                .clipShape(
                    SemiCircleMask(start: -180, end: -140)
                )
            
            
            Circle()
                .stroke(secondColor, lineWidth: 20)
                .background(Circle().fill(Color.clear))
                .clipShape(
                    SemiCircleMask(start: -134, end: -46)
                )
            
            Circle()
                .stroke(thirdColor, lineWidth: 20)
                .background(Circle().fill(Color.clear))
                .clipShape(
                    SemiCircleMask(start: -40, end: 0)
                )
            
            Text("$" + amount.string(maximumFractionDigits: 0))
                .foregroundStyle(Colors.blackCustom.swiftUIColor)
                .font(Fonts.KulimPark.regular.swiftUIFont(fixedSize: 45))
                .padding(.bottom)
        }
        .padding(.horizontal)
        .overlay {
            VStack {
                Spacer()
                
                Button {
                    onDetails()
                } label: {
                    RoundedRectangle(cornerRadius: 24)
                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                    .frame(height: 48)
                    .overlay {
                        HStack {
                            Image(systemName: "arrow.left")
                                .opacity(.zero)
                            Spacer()
                            Text("Widok")
                            Spacer()
                            Image(systemName: "arrow.right")
                        }
                        .foregroundStyle(.white)
                        .font(Fonts.KulimPark.regular.swiftUIFont(size: 15))
                        .padding(.horizontal)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
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
    ) {}
}
