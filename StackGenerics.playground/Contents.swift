//: Playground - noun: a place where people can play

import UIKit

//-------------------------------------------------------------------
// Stack without generics i.e this example can only handle Int
class Node {
    let value: Int
    var next: Node?
    
    init(value:Int) {
        self.value = value
    }
}

class Stack {
    
    var top : Node?
    
    func push (value: Int) {
        let oldTop = top
        top = Node(value:value)
        top?.next = oldTop
    }
    
    func pop () -> Int? {
        let currentTop = top
        top = top?.next
        return currentTop?.value
    }
    
    // See what's on top
    func peek() -> Int? {
        return (top?.value)
    }
}

let myStack = Stack()
myStack.push(value: 1)
myStack.push(value: 2)
myStack.push(value: 3)

let firstPop = myStack.pop()
myStack.peek()

let secondPop = myStack.pop()
myStack.peek()

let thirdPop = myStack.pop()
myStack.peek()

let fourthPop = myStack.pop()

//-------------------------------------------------------------------

class GenericNode<T> {
    var value: T
    var next: GenericNode?
    init(value:T) {
        self.value = value
    }
}

// This stack supports any data type to be pushed, popped, peeked!
class GenericStack<T> {
    
    var top : GenericNode<T>?
    
    func push (value: T) {
        let oldTop = top
        top = GenericNode(value:value)
        top?.next = oldTop
    }
    
    func pop () -> T? {
        let currentTop = top
        top = top?.next
        return currentTop?.value
    }
    
    // See what's on top
    func peek() -> T? {
        return (top?.value)
    }
}



struct Person {
    var firstName: String
    var lastName: String
}

let onePerson = Person(firstName: "Prashanth", lastName: "Patil")
let genericStackPerson = GenericStack<Person>()
let genericStackInt = GenericStack<Int>()

genericStackPerson.push(value: onePerson)
genericStackInt.push(value: 1)

genericStackPerson.pop()
genericStackInt.pop()

