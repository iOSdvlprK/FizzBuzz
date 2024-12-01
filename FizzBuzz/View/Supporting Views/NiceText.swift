//
//  NiceText.swift
//  FizzBuzz
//
//  Created by joe on 12/1/24.
//

import SwiftUI

struct NiceText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding()
    }
}

#Preview {
    NiceText(text: "Fizz")
}
