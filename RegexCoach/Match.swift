//
//  Match.swift
//  RegexCoach
//
//  Created by Alexander Ostrovsky on 21/3/2023.
//

import Foundation

struct Match: Identifiable {
    var id = UUID()
    var text: String
    var position: String
    var groups: [Match]?
}
