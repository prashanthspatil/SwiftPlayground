//: Playground - noun: a place where people can play

import UIKit

//https://www.youtube.com/watch?v=7BpLU9uhLCg
public class Contact {
    let name: String
    let phoneNumber: String?
    
    // Using unowned/weak in capture list break the strong reference cycle with closures
    // weak: If unsure about the capture list life, use weak
    // unowned: Captured instance is guarenteed, dont use for long running async operations, as the captured item might nil and crash
    public lazy var prettyPrint: () -> String = { [unowned self] in
        var result = self.name
        if let phoneNumber = self.phoneNumber {
            result = "Name \(result) phone \(phoneNumber)"
        }
        return result
    }
    
    init(name: String, phoneNumber: String? = nil) {
        self.name = name
        self.phoneNumber = phoneNumber
        print("Contact \(name) initailised")
    }
    
    deinit {
        print("Contact \(name) deinitailised")
    }
}

var contact:Contact? = Contact(name: "Prashanth", phoneNumber: "9999999999")
contact?.prettyPrint
contact = nil
