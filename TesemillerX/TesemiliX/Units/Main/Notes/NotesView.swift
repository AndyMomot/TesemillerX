//
//  NotesView.swift
//  TesemiliX
//
//  Created by Andrii Momot on 05.06.2024.
//

import SwiftUI

struct NotesView: View {
    @StateObject private var viewModel = NotesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundGradientView()
                    .ignoresSafeArea()
                
                List {
                    ForEach(viewModel.notes) { note in
                        NoteCell(note: note)
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    // Handle delete action
                                    viewModel.deleteNote(note: note)
                                } label: {
                                    Image(systemName: "trash")
                                }
                            }
                    }
                }
                .listStyle(PlainListStyle())
                .background {
                    Asset.notificationsBackground.swiftUIImage
                }
                .scrollContentBackground(.hidden)
                .padding(.horizontal)
                .padding(.vertical, UIScreen.main.bounds.height * 0.01)
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.showAddNote.toggle()
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.white)
                            
                    }
                    
                }
            }
            .onAppear {
                viewModel.getNotes()
            }
            .sheet(isPresented: $viewModel.showAddNote) {
                AddNoteView {
                    viewModel.getNotes()
                }
            }
        }
    }
}

#Preview {
    NotesView()
}
