//
//  FizzBuzzAlgModel.swift
//  FizzBuzz
//
//  Created by joe on 12/2/24.
//

import Foundation

//let MAX = 100
//for i in 1...MAX {
//    // if multiple of 3 then print Fizz
//    if i % 15 == 0 {
//        print("FizzBuzz\t", terminator: "")
//    } else if i % 3 == 0 {
//        print("Fizz\t", terminator: "")
//    } else if i % 5 == 0 {
//        print("Buzz\t", terminator: "")
//    } else {
//        print("\(i)\t", terminator: "")
//    }
//}

struct FizzBuzzAlgModel: Identifiable {
    let id = UUID()
    
    let name: String
    var commentCode: (String) -> String = { code in
        return #"// "# + code
    }
    var versionNumber: Double? = nil
    var imports: String = ""
    var boilerWrapper: (String) -> String = { code in
        return code
    }
    let maxConstDef: String
    let loopWrapper: (String) -> String
    let printString: (String) -> String
    let printInt: () -> String
    var equality: String = "=="
    var moduloSymbol: String = "%"
    let ifStatement: (String, String) -> String
    let elseIfStatement: (String, String) -> String
    let elseStatement: (String) -> String
    
    var actualFizzBuzzCode: String {
        "FizzBuzz in \(name)"
    }
}
