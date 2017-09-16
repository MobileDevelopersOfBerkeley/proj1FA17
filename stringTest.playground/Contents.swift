//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let strLower : String = str.lowercased()

extension String{
    func removeWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}
let strNoSpace : String = str.removeWhitespaces()
print(strNoSpace)