//: Playground - noun: a place where people can play

import UIKit

protocol GameUnit {
    var id: String {get}
    var isAlive: Bool{get set}
    var healthLevel: Int{get set}
    mutating func hitTaken()
}

extension GameUnit {
    mutating func hitTaken() {
        if healthLevel > 0 {
            healthLevel -= 1
            if healthLevel == 0 {
                isAlive = false
            }
        } else {
            isAlive = false
        }
        let state = isAlive ? String(repeating: "Hit", count: healthLevel) : "Dead"
        print("\(id): Argh! \(state)")
    }
}

class Peasant: GameUnit {
    var id: String
    var isAlive = true
    var healthLevel: Int = 2
    
    init(name: String) {
        id = name
    }
}

var peasant = Peasant(name: "Peasant")
peasant.hitTaken()
peasant.hitTaken()
peasant.hitTaken()

class Soilder: GameUnit {
    var id: String
    var isAlive = true
    var healthLevel: Int = 5
    
    init(name: String) {
        id = name
    }
}

var soilder = Soilder(name: "Solider")
soilder.hitTaken()
soilder.hitTaken()
soilder.hitTaken()
soilder.hitTaken()
soilder.hitTaken()

class Knight: GameUnit {
    var id: String
    var isAlive = true
    var healthLevel: Int = 10
    
    init(name: String) {
        id = name
    }
}

extension GameUnit where Self: Knight {
    mutating func hitTaken() {
        if healthLevel > 0 {
            healthLevel -= 1
            if healthLevel == 0 {
                isAlive = false
            }
        } else {
            isAlive = false
        }
        let state = isAlive ? String(repeating: "Hit", count: healthLevel) : "Dead"
        print("\(id): Argh! \(state)")
    }
}

var knight = Knight(name: "knight")
knight.hitTaken()
knight.hitTaken()
knight.hitTaken()
knight.hitTaken()
knight.hitTaken()
knight.hitTaken()
knight.hitTaken()
knight.hitTaken()
knight.hitTaken()
knight.hitTaken()
knight.hitTaken()
knight.hitTaken()
