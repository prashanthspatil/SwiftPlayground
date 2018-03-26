//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let result = (1...)
    .lazy
    .map { $0 * $0 }
    .first(where: { $0 > 100})

let results = (1...)
    .lazy
    .map { $0 * $0 }
    .filter { $0 > 100 }
Array(results.prefix(10))
