//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum ResourceError: Error {
    case invalidPath
    case missing(validPaths: [String])
}

extension ResourceError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidPath:
            return NSLocalizedString("The path is invalid", comment: "")
        case .missing(let validPaths):
            return NSLocalizedString("Missing resource. valid resource are: \(validPaths)", comment: "")
        }
    }
}

func readResource(atPath: String) throws -> Data? {
    guard atPath.isEmpty != true else {
        throw ResourceError.invalidPath
    }
    let resourcePaths = ["sandbox/image", "sandbox/doc"]
    guard resourcePaths.contains(atPath) == true else {
        throw ResourceError.missing(validPaths: resourcePaths)
    }
    return nil
}

// Use try when along with do-catch, and capture each error
do {
    let data = try readResource(atPath: "asd")
    print(data)
    
} catch ResourceError.invalidPath {
    print("Error! invalid path")
} catch ResourceError.missing(let validPaths) {
    print("missing, valid paths are \(validPaths)")
}

// Use try when along with do-catch, and capture each error
do {
    let data3 = try readResource(atPath: "asd")
    print(data3)
    
} catch let error as  ResourceError{
    print("\(error.errorDescription!)")
}

// Use try? when the dont care the error, wont get the actual reason
let data1 = try? readResource(atPath: "")
if data1 == nil {
    print("Could not read resource")
}

// use try! when we are sure that no error occurs, but if error occurs then application crashes
let data2 = try! readResource(atPath: "")
