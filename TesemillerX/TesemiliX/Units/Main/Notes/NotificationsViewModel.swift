//
//  NotificationsViewModel.swift
//  TesemiliX
//
//  Created by Andrii Momot on 05.06.2024.
//

import Foundation

extension NotesView {
    final class NotesViewModel: ObservableObject {
        @Published var notes: [Note] = []
        @Published var showAddNote = false
        
        func getNotes() {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.notes = DefaultsService.getNotes()
            }
        }
        
        func deleteNote(note: Note) {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                
                if let index = self.notes.firstIndex(where: {
                    $0.id == note.id
                }) {
                    self.notes.remove(at: index)
                    DefaultsService.setNotes(self.notes)
                }
            }
        }
    }
}

extension NotesView.NotesViewModel {
    struct Note: Identifiable, Codable, Hashable {
        private(set) var id = UUID().uuidString
        private(set) var date = Date()
        
        var title, text: String
        
        var dateText: String {
            if date.isToday() {
                return "Dzisiaj"
            } else {
                return date.toString(format: .ddMMyy)
            }
        }
    }
}
