//
//  CodeCreatorView.swift
//  FizzBuzz
//
//  Created by joe on 12/1/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct CodeCreatorView: View {
    @StateObject var fizzBuzzAlgViewModel = FizzBuzzAlgViewModel()
    
    var body: some View {
        NavigationStack {
            List(fizzBuzzAlgViewModel.fizzBuzzModels) { item in
                NavigationLink(item.name) {
                    ZStack {
                        Color
                            .gray
                            .opacity(0.3)
                            .ignoresSafeArea()
                        
                        ScrollView {
                            VStack {
                                Text(item.actualFizzBuzzCode)
                                    .font(.headline)
                                    .padding()
                                    .minimumScaleFactor(0.1)
                                    .contextMenu {
                                        Button(
                                            action: {
                                                UIPasteboard.general.string = item.actualFizzBuzzCode
                                            },
                                            label: {
                                                Text("Copy to clipboard")
                                                Image(systemName: "doc.on.doc")
                                            }
                                        )
                                    }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Fizz Buzz")
        }
    }
}

#Preview {
    CodeCreatorView()
}
