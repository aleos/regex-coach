//
//  ViewModel.swift
//  RegexCoach
//
//  Created by Alexander Ostrovsky on 21/3/2023.
//

import SwiftUI

class ViewModel: ObservableObject {
    @AppStorage("pattern") var pattern = "" { didSet {update() } }
    @AppStorage("input") var input = "Text to match here" { didSet {update() } }
    @AppStorage("replacement") var replacement = "" { didSet {update() } }
    
    @Published var replacementOutput = ""
    @Published var matches = [Match]()
    @Published var isValid = true
    
    var code: String {
        "Hello, Swift!"
    }
    
    func update() {
        guard !pattern.isEmpty else { return }
        print("Running pattern…")
    }
}
