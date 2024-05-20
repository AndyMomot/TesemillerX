//
//  PrivacyPolicyViewModel.swift
//  TesemillerX
//
//  Created by Andrii Momot on 20.05.2024.
//

import Foundation

extension PrivacyPolicyView {
    final class PrivacyPolicyViewModel: ObservableObject {
        let url = URL(string: "https://www.google.com")
        @Published var isAgreed = false
    }
}
