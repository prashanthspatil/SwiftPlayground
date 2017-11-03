//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Contact: Hashable {
    var identifier: String
    
    public var hashValue: Int {
        return identifier.hash
    }
    
    static func == (lhs: Contact, rhs: Contact) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

var contactArray = [Contact]()
contactArray.append(Contact.init(identifier: "a"))

// If Custom struct/class need to be used in set we need to implement hashable & equaltable protocol
var contactSet = Set<Contact>()
