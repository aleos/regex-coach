//
//  ViewModel.swift
//  RegexCoach
//
//  Created by Alexander Ostrovsky on 21/3/2023.
//

import SwiftUI

class ViewModel: ObservableObject {
    var pattern = ""
    var input = "Text to match here"
    var replacement = ""
    
    var replacementOutput = ""
    var matches = [Match]()
    var isValid = true
    
    var code: String {
        "Hello, Swift!"
    }
    
    func update() {
        guard !pattern.isEmpty else { return }
        print("Running pattern…")
    }
}
