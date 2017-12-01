//: Playground - noun: a place where people can play

import UIKit

protocol InitializationProtocol {
    init(name:String)
}

class Animal: InitializationProtocol {
    var name: String
    required init(name: String) {
        self.name = name
        print("Animal \(self.name) initialized")
    }
    deinit {
        print("Animal \(self.name) deinitalized")
    }
}

class Tiger: Animal {
    required init(name: String) {
        super.init(name: name)
        print("Tiger \(self.name) initialized")
    }
    deinit {
        print("Tiger \(self.name) deinitialized")
    }
}

var tiger: Tiger? = Tiger(name: "tiger")
tiger = nil
