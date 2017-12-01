//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// O(1): Constant time
let a = 1, b = 2
let c = a + 5*b

var d = 0
while d < 11  {
    d += 1
}

// O(n): Linear time
func incrementE(n: Int){
    var e = 0
    while e < n {
        e += 1
    }
}

func incrementJ(n: Int) {
    var j = 0
    while j < n {
        j += 3
    }
}

// O(log(n))
// This example is for sorted array
//var elementsArray = [1000, 1, 2, 23, 5, 6, 23, 122, 54, 12]
var elementsArray = Array(1...1000000)
let elementToFind = 1
var low = 0
var high = elementsArray.count - 1

enum ElementError: Error { case NotFound }
do
{ print("Element Position is \(try findElementPositionOf(999999, inArray: elementsArray))") }
catch let error { print(error.localizedDescription) }

extension ElementError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .NotFound:
            return NSLocalizedString("Element not found in array", comment: "")
        }
    }
}

func findElementPositionOf(_ elementToBeFound: Int, inArray: [Int]) throws -> Int {
    var positionOfFoundElement: Int?
    var elements = inArray
    elements.sort()
    if elementToBeFound > elements[high] {
        throw ElementError.NotFound
    } else {
        var i = 0
        while low <= high {
            let mid = (low + high) / 2
            print("i:\(i), low: \(low), high: \(high), mid: \(mid)")
            if elements[mid] == elementToBeFound {
                positionOfFoundElement = mid
                break
            } else if elements[mid] < elementToBeFound {
                low = mid + 1
            } else if elements[mid] > elementToBeFound {
                high = mid - 1
            }
            i += 1
        }
        if high < low { throw ElementError.NotFound }
        return positionOfFoundElement!
    }
}

// O(n^2): n square
func bigOSquareN() {
    var squareI = 0
    let n = 10
    while squareI < n { // 10 times
        var squareJ = 0
        while squareJ < 3*n { //30 times
            squareJ += 1
        }
        squareJ = 0
        while squareJ < 2*n { //20 times
            squareJ += 1
        }
        squareI += 1
        // n * (3n+2n) = n^2
        // 10 times * (30 times +20 times) = 500 = 5*100 = 5*10^2 = 5n^2 = n^2
    }
}

// O(n^4): n Quadratic
func bigOQuadraticN() {
    var squareI = 0
    let n = 10
    while squareI < 3 * n { // a times
        var squareJ = 0
        while squareJ < 40 { //b = 40
            squareJ += 1
        }
        squareJ = 0
        while squareJ < n*n*n { //c = 30000 times = n^3
            squareJ += 2 // d = 2: since its increment by 2, loop would run by half times
        }
        squareI += 1
        //f(n) = a * (b + c/d) = 3n * (40 + n^3/2) = 3n/40 + 3n^4/2 = n^4
        // O(f(n)) = O(n^4)
    }
}
