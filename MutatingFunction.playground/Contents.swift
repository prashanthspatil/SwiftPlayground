//: Playground - noun: a place where people can play

import UIKit

protocol ToggleProtocol {
    mutating func toggle()
}

enum Switcher: ToggleProtocol {
    case off
    case on
    // Use mutating function when self is modified...used with struct, enum
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

var lightSwitch = Switcher.on
lightSwitch.toggle()
lightSwitch.hashValue
lightSwitch.toggle()
lightSwitch.hashValue
