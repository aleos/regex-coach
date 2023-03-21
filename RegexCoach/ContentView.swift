//
//  ContentView.swift
//  RegexCoach
//
//  Created by Alexander Ostrovsky on 21/3/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model = ViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter your regular expression", text: $model.pattern)
            TextEditor(text: $model.input)
            
            TabView {
                List(model.matches) { match in
                    Text("\(match.text) (\(match.position))")
                }
                .tabItem {
                    Text("Matches")
                }
                
                Text("replacement")
                
                Text("Generated Code")
            }
        }
        .onAppear(perform: model.update)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
