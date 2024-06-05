//
//  PrivacyPolicyViewModel.swift
//  TesemillerX
//
//  Created by Andrii Momot on 20.05.2024.
//

import Foundation

extension PrivacyPolicyView {
    final class PrivacyPolicyViewModel: ObservableObject {
        let privacyURL = URL(string: "https://tesemilix.info/")
        @Published var isAgreed = false
    }
}
