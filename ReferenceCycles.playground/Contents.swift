//: Playground - noun: a place where people can play

import UIKit

// -----------------------------------------------------------------------------------------------------
class Customer {
    var name: String
    var creditCard: CreditCard?
    init(name: String) {
        self.name = name
        print("User \(self.name) initialized")
    }
    deinit {
        print("User \(self.name) deinitialized")
    }
}

class CreditCard {
    var cardNumber: UInt64
    // unowned: Use when the object's(CreditCard) is almost equal to other object's(User) lifetime
    unowned var user: Customer
    init(cardNumber: UInt64, user: Customer) {
        self.cardNumber = cardNumber
        self.user = user
        print("CreditCard for \(self.cardNumber) initalized")
    }
     
     deinit {
        print("CreditCard for \(self.cardNumber) deinitalized")
    }
}

var customerOne: Customer? = Customer(name: "User_one")
var creditCard: CreditCard? = CreditCard(cardNumber: 1234_1234_1234_1234, user: customerOne!)
customerOne?.creditCard = creditCard
customerOne = nil
creditCard = nil

// -----------------------------------------------------------------------------------------------------

class User {
    var name: String
    init(name: String) {
        self.name = name
        print("\(self.name) initialized")
    }
    // Deinit is called only when there are no references to this object
    deinit {
        print("\(self.name) deinitialized")
    }
}

var firstUser: User? = User(name: "Customer1") // First reference
var secondUser = firstUser // Second reference
var thirdUser = firstUser // Third reference
var fourthUser = firstUser // Fourth reference
// At this stage there are 4 references to Customer object, unless 4 references are deferenced the customer object doesnt get deinitalized
firstUser = nil
secondUser = nil
thirdUser = nil
fourthUser = nil // At this stage there is no reference to Customer object so the object is deinitalized

// -----------------------------------------------------------------------------------------------------

class Author {
    var name: String
    var residence: Residence
    init(name: String, residence: Residence) {
        self.name = name
        self.residence = residence
        print("\(self.name) initalized")
    }
    deinit {
        print("\(self.name) deinitalized")
    }
}

class Residence {
    var address: String
    // User weak when life time is less
    weak var author: Author?
    init(address: String) {
        self.address = address
        print("\(self.address) initalized")
    }
    deinit {
        print("\(self.address) deinitalized")
    }
}

var residence: Residence? = Residence(address: "Earth")
var author: Author? = Author(name: "Author", residence: residence!)
residence?.author = author
residence = nil
author = nil

// -----------------------------------------------------------------------------------------------------
