//: Playground - noun: a place where people can play

import UIKit

// --------------------------------------------------------------------
// Breaking retain cycle inside block using "weak self" example
class User {
    let firstName: String?
    let lastName: String?
    
    lazy var fullName: () -> String = { [weak self] in
        guard let this = self else { return ""}
        return "\(this.firstName!)" + " \(this.lastName!)"
    }
    
    init(firstName:String?, lastName:String?) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    deinit {
        print("\(self) Deinit called")
    }
}

var user1:User? = User(firstName: "prashanth", lastName: "patil")
user1?.fullName()
user1 = nil

// --------------------------------------------------------------------
// Breaking retain cycle using "weak" example
class Person {
    var firstName:String?
    var lastName: String?
    var accomodation: Apartment?
    init(firstName:String?, lastName:String?) {
        self.firstName = firstName
        self.lastName = lastName
    }
    deinit {
        print("\(self) Deinit called")
    }
}

class Apartment {
    let propertyNumber: Int
    weak var tenant: Person?
    
    init(propertyNumber: Int) {
        self.propertyNumber = propertyNumber
    }
    deinit {
        print("\(self) Deinit called")
    }
}

var apt: Apartment? = Apartment(propertyNumber:123)
var bob: Person? = Person(firstName:"Prashanth", lastName: "Patil")
apt?.tenant = bob
bob?.accomodation = apt
apt = nil
bob = nil
// --------------------------------------------------------------------
// Generic function for swapping 2 objects
class Swap<T> {
    func swap(oneInt: inout T, secondInt: inout T) {
        let temp = oneInt
        oneInt = secondInt
        secondInt = temp
    }
}

var intSwapper = Swap<Int>()
var one = 1
var two = 2
intSwapper.swap(oneInt: &one, secondInt: &two)
one
two

var stringSwapper = Swap<String>()
var oneString = "First"
var secondString = "Second"
stringSwapper.swap(oneInt: &oneString, secondInt: &secondString)
oneString
secondString