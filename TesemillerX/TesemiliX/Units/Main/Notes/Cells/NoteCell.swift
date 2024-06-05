//
//  NoteCell.swift
//  TesemiliX
//
//  Created by Andrii Momot on 05.06.2024.
//

import SwiftUI

struct NoteCell: View {
    var note: NotesView.NotesViewModel.Note
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Text(note.title)
                    .foregroundStyle(.white)
                    .font(Fonts.KulimPark.bold.swiftUIFont(size: 18))
                
                Spacer()
                
                Text(note.dateText)
                    .foregroundStyle(Colors.grayMiddle.swiftUIColor)
                    .font(Fonts.KulimPark.bold.swiftUIFont(size: 16))
            }
            .background(.clear)
            
            Text(note.text)
                .foregroundStyle(.white)
                .font(Fonts.KulimPark.regular.swiftUIFont(size: 12))
        }
        .padding(.vertical)
        .background(.clear)
    }
}

#Preview {
    ZStack {
        BackgroundGradientView()
        
        NoteCell(note: .init(
            date: .init(),
            title: "Powiadomienie",
            text: "Witaj! Chcieliśmy Cię poinformować, że w naszej aplikacji została dodana nowa funkcja - możliwość przypisania adresu e-mail do Twojego konta. Teraz możesz łatwiej odzyskać hasło i otrzymywać ważne powiadomienia. Zaktualizuj aplikację, aby skorzystać z tej funkcji już teraz! Dziękujemy za korzystanie z naszej aplikacji!"
        ))
    }
}
