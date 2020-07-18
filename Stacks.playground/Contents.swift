import UIKit

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
