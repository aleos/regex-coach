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
        
        do {
            let regex = try Regex(pattern)
            let results = input.matches(of: regex)
            isValid = true
            
            matches = results.compactMap { result in
                let wholeText = String(input[result.range])
                guard !wholeText.isEmpty else { return nil }
                
                var wholeMatch = Match(text: wholeText, position: result.range.position(in: input))
                // handle capture groups
                return wholeMatch
            }
        } catch {
            matches.removeAll()
            replacementOutput = ""
            isValid = false
        }
    }
}
