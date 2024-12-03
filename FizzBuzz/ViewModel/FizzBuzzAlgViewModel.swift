//
//  FizzBuzzAlgViewModel.swift
//  FizzBuzz
//
//  Created by joe on 12/3/24.
//

import Foundation

class FizzBuzzAlgViewModel: ObservableObject {
    @Published var fizzBuzzModels: [FizzBuzzAlgModel] = []
    
    init() {
        fizzBuzzModels = [
            .init(
                name: "Swift",
                maxConstDef: "let MAX = 100",
                loopWrapper: { code in
                    """
                    for i in 1...MAX {
                        \(code)
                    }
                    """
                },
                printString: { str in
                    #"print("\#(str)", terminator: "\t")"#
                },
                printInt: {
                    #"print("\(i)", terminator: "\t")"#
                },
                ifStatement: { logic, code in
                    """
                    if \(logic) {
                        \(code)
                    }
                    """
                },
                elseIfStatement: { logic, code in
                    """
                    else if \(logic) {
                        \(code)
                    }
                    """
                },
                elseStatement: { code in
                    """
                    else {
                        \(code)
                    }
                    """
                }
            ),
            .init(
                name: "C",
                versionNumber: 1.0,
                imports: "#include <stdio.h>",
                boilerWrapper: { code in
                    """
                    int main() {
                        \(code)
                    }
                    """
                },
                maxConstDef: "#define MAX 100",
                loopWrapper: { code in
                    """
                    for (int i = 1; i <= MAX; i++) {
                        \(code)
                    }
                    """
                },
                printString: { str in
                    #"printf("\#(str)\t");"#
                },
                printInt: {
                    #"printf("%d\t", i);"#
                },
                ifStatement: { logic, code in
                    """
                    if (\(logic)) {
                        \(code)
                    }
                    """
                },
                elseIfStatement: { logic, code in
                    """
                    else if (\(logic)) {
                        \(code)
                    }
                    """
                },
                elseStatement: { code in
                    """
                    else {
                        \(code)
                    }
                    """
                }
            )
        ]
    }
}

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
