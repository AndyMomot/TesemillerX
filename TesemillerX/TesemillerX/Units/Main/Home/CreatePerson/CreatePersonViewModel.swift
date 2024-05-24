//
//  CreatePersonViewModel.swift
//  TesemillerX
//
//  Created by Andrii Momot on 24.05.2024.
//

import SwiftUI

extension CreatePersonView {
    final class CreatePersonViewModel: ObservableObject {
        @Published var showImagePicker = false
        @Published var selectedImage: Image = .init(systemName: "person.circle.fill")
        @Published var firstName = ""
        @Published var lastName = ""
    }
}
