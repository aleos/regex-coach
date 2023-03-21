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
                .foregroundColor(model.isValid ? .primary : .red)
            TextEditor(text: $model.input)
                .padding(5)
                .border(.quaternary)
            
            TabView {
                List(model.matches) { match in
                    Text("\(match.text) (\(match.position))")
                        .font(.title3)
                }
                .tabItem {
                    Text("Matches")
                }
                
                Text("replacement")
                
                Text("Generated Code")
            }
        }
        .onAppear(perform: model.update)
        .scrollContentBackground(.hidden)
        .font(.title3)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
