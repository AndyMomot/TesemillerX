//
//  LoaderView.swift
//  TesemillerX
//
//  Created by Andrii Momot on 17.05.2024.
//

import SwiftUI

struct LoaderView: View {
    @State private var selectedIndex = 0
    @State private var timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()
    
    @State private var colorFirst = Colors.grayCustom.swiftUIColor.opacity(1)
    @State private var colorSecond = Colors.grayCustom.swiftUIColor.opacity(0.7)
    @State private var colorThird = Colors.grayCustom.swiftUIColor.opacity(0.4)
    
    var body: some View {
        let arrange = Array(0...2)
        HStack(spacing: 20) {
            ForEach(arrange, id: \.self) { index in
                Circle()
                    .foregroundStyle(getCurrentColor(for: index))
            }
        }
        .onReceive(timer) { input in
            DispatchQueue.main.async {
                withAnimation {
                    self.updateSelectedIndex()
                    self.updateColors()
                }
            }
        }
    }
}

private extension LoaderView {
    func updateSelectedIndex() {
        if self.selectedIndex >= 2 {
            self.selectedIndex = 0
        } else {
            self.selectedIndex += 1
        }
    }
    
    func getCurrentColor(for index: Int) -> Color {
        switch index {
        case 1:
            return colorSecond
        case 2:
            return colorThird
        default:
            return colorFirst
        }
    }
    
    func updateColors() {
        switch selectedIndex {
        case 1:
            colorFirst = Colors.grayCustom.swiftUIColor.opacity(1)
            colorSecond = Colors.grayCustom.swiftUIColor.opacity(0.7)
            colorThird = Colors.grayCustom.swiftUIColor.opacity(0.4)
        case 2:
            colorFirst = Colors.grayCustom.swiftUIColor.opacity(0.4)
            colorSecond = Colors.grayCustom.swiftUIColor.opacity(1)
            colorThird = Colors.grayCustom.swiftUIColor.opacity(0.7)
        default:
            colorFirst = Colors.grayCustom.swiftUIColor.opacity(0.7)
            colorSecond = Colors.grayCustom.swiftUIColor.opacity(0.4)
            colorThird = Colors.grayCustom.swiftUIColor.opacity(1)
        }
    }
}

#Preview {
    LoaderView()
}
