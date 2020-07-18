import UIKit

// Given a string, find if it’s open and close parentheses are balanced.

struct Stack<T> {
  private var array: [T] = []

  @discardableResult mutating func pop() -> T? {
    array.popLast()
  }

  mutating func push(element: T) {
    array.append(element)
  }

  func peek() -> T? {
    return array.last
  }

  var isEmpty: Bool {
    return array.isEmpty
  }
}

extension Character {
  func isMatchingPair(closing: Character) -> Bool {
    switch self {
    case "(":
      return closing == ")"
    case "[":
      return closing == "]"
    case "{":
      return closing == "}"
    default:
      return false
    }
  }
}

extension String {
  var openingParentheses: [String] {
    return ["(", "[", "{"]
  }

  var closingParentheses: [String] {
    return [")", "}", "]"]
  }

  var hasBalancedParentheses: Bool {
    var parentheses: Stack<Character> = Stack()

    for char in self {

      if parentheses.isEmpty {
        if openingParentheses.contains("\(char)") {
          parentheses.push(element: char)
        } else if closingParentheses.contains("\(char)") {
          return false
        }
      } else {
        if let top = parentheses.peek() {
          if top.isMatchingPair(closing: char) {
            parentheses.pop()
          } else if openingParentheses.contains("\(char)") {
            parentheses.push(element: char)
          }
        }
      }
    }
    return parentheses.isEmpty
  }
}

var teststring="({})"

teststring.hasBalancedParentheses
