//
//  AddNoteViewModel.swift
//  TesemiliX
//
//  Created by Andrii Momot on 05.06.2024.
//

import Foundation

extension AddNoteView {
    final class AddNoteViewModel: ObservableObject {
        @Published var title = ""
        @Published var text = ""
        
        func saveNote(completion: @escaping () -> Void) {
            guard !title.isEmpty, !text.isEmpty else { return }
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                let note = NotesView.NotesViewModel.Note(
                    title: self.title,
                    text: self.text
                )
                DefaultsService.addNote(note)
                completion()
            }
        }
    }
}
