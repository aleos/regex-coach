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
                
                if result.count > 1 {
                    wholeMatch.groups = [Match]()
                    
                    for part in result.indices.dropFirst() {
                        let match = result[part]
                        guard let range = match.range else { continue }
                        
                        let matchText = String(input[range])
                        if matchText.isEmpty { continue }
                        
                        let partMatch = Match(text: matchText, position: range.position(in: input))
                        wholeMatch.groups?.append(partMatch)
                    }
                }
                
                return wholeMatch
            }
        } catch {
            matches.removeAll()
            replacementOutput = ""
            isValid = false
        }
    }
}
