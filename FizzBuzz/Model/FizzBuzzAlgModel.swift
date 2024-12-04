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
        let mod3 = "i \(moduloSymbol) 3 \(equality) 0"
        let codeFizz = printString("Fizz")
        
        let mod5 = "i \(moduloSymbol) 5 \(equality) 0"
        let codeBuzz = printString("Buzz")
        
        let mod15 = "i \(moduloSymbol) 15 \(equality) 0"
        let codeFizzBuzz = printString("FizzBuzz")
        
        let printInt = printInt()
        
        let codeInLoop = """
        \(ifStatement(mod15, codeFizzBuzz)) \(elseIfStatement(mod3, codeFizz.indent())) \(elseIfStatement(mod5, codeBuzz.indent())) \(elseStatement(printInt.indent()))
        """
        
        let mainCode = """
        \(maxConstDef)
        
        \(loopWrapper(codeInLoop))
        """
        
        var versionString = ""
        
        if let versionNumber {
            versionString = " implementation Version \(versionNumber)"
        }
        
        return """
        \(commentCode("FizzBuzz\(versionString) is implemented in the \(name) programming language."))
        \(imports)
        \(boilerWrapper(mainCode))
        """
    }
}
