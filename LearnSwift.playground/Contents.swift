//: Playground - noun: a place where people can play

import UIKit


// https://www.youtube.com/user/madapperapps/playlists


/* Classes & Structs:
 
BOTH
 
    Define Properties to store values
    Define methods to provide functionality
    Define sibscropts to provide access to their variables
    Define initalizers
    Be extended
    Conformt to protocols
 
CLASSES ONLY
 
    Inheritance
    Type casting
    Define deinitalizes
    Allow reference counting for multiple references
    Typed property is created by keyword “class” i.e these properties/methods don't need instance

STRUCTS ONLY

    No inheritance
    passed by value
    we get default initializer
    can’t have deinit
    Typed property is created by keyword “static” i.e these properties/methods don't need instance
*/

// --------------------------------------------------------------
class MyClass {
    var classProperty1 = 0
    var classProperty2 = 0
}

struct MyStruct {
    var structProperty1 = 0
    var structProperty2 = 0
}

var myClass = MyClass() // Classes dont have inbuilt initializer :(
var myStruct = MyStruct(structProperty1: 10, structProperty2:  20) // Inbuilt initalizer available only with struct

// --------------------------------------------------------------

class Person {
    var name = ""
    var age  = 0
    var isMale = false
    var bodyStats = BodyStats()
}

struct BodyStats {
    var height:Float = 0
    var weight:Float = 0
}

var bodyStats = BodyStats()
var bodyStats2 = bodyStats // value is copied coz its struct!

bodyStats2.height = 20

print(bodyStats.height)
print(bodyStats2.height)

var person1 = Person()
person1.name = "A"

var person2 = person1 // Value is referenced in classes!
person2.name = "B"

print(person1.name)
print(person2.name)

// --------------------------------------------------------------

var bodyStats1 = BodyStats(height: 180, weight: 80)
var person = Person()
print(bodyStats1.height) // read property by .
print(bodyStats1.weight)

bodyStats1.height = 188
bodyStats1.weight = 88

person.bodyStats = bodyStats1
print(person.bodyStats.height)
print(person.bodyStats.weight)

// --------------------------------------------------------------

// Stored properties: is var/const that is declared as part of classes/struct/enum

let bodyStats3 = BodyStats(height: 170, weight: 90) // since structs are value types using 'let' while creating struct type affected the properties! so this throws the error
//bodyStats3.height = 200
//bodyStats3.weight = 100

let person3 = Person() // Classes are of ref types so declaration as let doesnt effect the properties
person3.name = "paul"

// --------------------------------------------------------------

//Lazy stored properties: declare propeties as lazy if they take substantial amount of memory or time to initialize e.g downloading.

// ONLY var CAN BE LAZY; let cant be

class LazyClass {
    var exerciseFileName = "" //
}

class ExcersiseRoutine {
    var duration = 0
    var exerciseType = ""
    lazy var myLazyClass = LazyClass()
}

var exercise = ExcersiseRoutine()
exercise.duration = 10
exercise.exerciseType = "Cardio"
exercise.myLazyClass.exerciseFileName = "hellow world"

// --------------------------------------------------------------
        
//Computed properties are not used to store value but to get & set
extension BodyStats {
    // Computed property
    var bmi: Float {
        get{
           return weight/pow(height/100, 2)
        }
        set (newBMI) // renamed as it improves readabilty
        {
            weight = newBMI * pow(height/100, 2)
        }
    }
}

var myBodyStats = BodyStats(height: 180, weight: 80)
myBodyStats.bmi // Using computed property! :)
myBodyStats.bmi = 22
print(myBodyStats.weight) // Weight amended using computed property!

// --------------------------------------------------------------

// Property observers: willSet: called before set & didSet: called after set

struct PropertyObservers {
    var value1: Float = 0 {
        willSet(newValue){
            print("Old value \(value1) new value \(newValue)")
        }
        didSet (oldValue) {
            print("Old value \(oldValue) new value \(value1)")
        }
    }
}

var properyObservers = PropertyObservers(value1: 10)
properyObservers.value1 = 12

// --------------------------------------------------------------

// Type propeties:
// declare as "static" in struct & "class" in class
// Need inital value before compiling

struct TypePropertyStruct {
    static var height:Float = 0
}

class TypePropertyClass  {
    class var planet:String {
        return "earth"
    }
}

// --------------------------------------------------------------


/*
 The first parameter of a function has no external parameter name by default
 All other parameters share the same external/internal parameter name by default
 # shorthand is no longer available, if you want the first parameter to have the same external name as the internal, you have to "double" the parameter names
 All external parameter names can be overridden
 You can omit external parameter names by using _
 */
class FuncWithExternalInternalParametersNames {
    func parameters(weightInKg weight:Double, heightInCm height:Double) -> Double {
        return 100.0
    }
    func parameter(weight:Double, height:Double) -> Double {
        return 100.0
    }
}

var externalInternalParametersNames = FuncWithExternalInternalParametersNames()
externalInternalParametersNames.parameter(weight: 10.0, height: 10.0)
externalInternalParametersNames.parameters(weightInKg: 10.0, heightInCm: 10.0)

// --------------------------------------------------------------

// Illustartion of self
struct SelfIllustration {
    var length = 20.0
    var breadth = 20.0
    
    func myArea(length: Double, breadth: Double) -> Double {
        return length * breadth
    }
    
    func myActualArea(length: Double, breadth: Double) -> Double {
        // Using self inside func for ivars refer to iVar and not parameters i.e avodiing overring
        return self.length * self.breadth
    }
}

var selfIllustrator = SelfIllustration()
//selfIllustrator.length = 10
//selfIllustrator.breadth = 10
selfIllustrator.myArea(length: 10.0, breadth: 10.0)
selfIllustrator.myActualArea(length: 10.0, breadth: 10.0)

// --------------------------------------------------------------

// Mutating methods: It is not possible to modify properties of value types in struct & enum within in instance method. Create new instances of properties

struct MutatingIllustartor {
    var height = 0.0
    
    mutating func amendHeight(heightChange: Double) {
        self = MutatingIllustartor(height: height + heightChange) // Intersting!: assigned changed value to self, so that the changed value is assigned to original property
    }
}

var mutator = MutatingIllustartor(height: 20)
print("Original Height \(mutator.height)")
mutator.amendHeight(heightChange: 20)
print("Amended Height 1\(mutator.height)")
mutator.amendHeight(heightChange: 20)
print("Amended Height 2 \(mutator.height)")
mutator.amendHeight(heightChange: 20)
print("Amended Height 3 \(mutator.height)")

// --------------------------------------------------------------

// Type/class methods:

struct TypeMethodsIllustrator {
    static func difference(value1: Double, value2:Double) -> Double {
        return value1 - value2
    }
}

var difference = TypeMethodsIllustrator.difference(value1: 10, value2: 8)
print(difference)

// --------------------------------------------------------------

struct SubscriptIllustration {
    var bodyPartArray = ["eye", "nose", "ear", "cheek", "leg", "hand", "next", "ankel", "elbow", "finger", "toe", "back"]
    var alphabetArray = ["a", "b", "c", "d", "e", "f", "a", "b", "c", "d", "e", "f"]
    var personArray = ["sam", "dave", "chi", "mam", "myself"]
    
    subscript (index: Int) -> String{
        get {
            return alphabetArray[index]
        }
        set {
            if (alphabetArray.count < index) {
                alphabetArray.append(newValue)
            }
            else {
                alphabetArray.insert(newValue, at: index)
            }
        }
    }
    
    // Returns the number of occurance of the string in the array
    subscript(bodyPart: String) -> Int {
        var stringOccuranceCount = 0
        for alphabet in alphabetArray {
            if (alphabet == bodyPart) {
                stringOccuranceCount += 1
            }
        }
        return stringOccuranceCount
    }
    
    subscript(indexOfBodyPart: Int, indexOfPerson: Int) -> (person: String, bodyPart: String) {
        let bodyPart = bodyPartArray[indexOfBodyPart]
        let person = personArray[indexOfPerson]
        
        return (person, bodyPart)
    }
}

var subscriptIllustrator = SubscriptIllustration()
subscriptIllustrator[2] // Just passing a index directly to struct we can retrieve array context at said index with the help of subscript!
// Subscript 1
subscriptIllustrator[7] = "g" // insert/append depending on index
print(subscriptIllustrator.alphabetArray)

// Subscript 2
subscriptIllustrator[2,2] // retrieves the tupel matching the array

// Subscript 3
subscriptIllustrator["a"] // retrieves the occurance of the strings in array

// --------------------------------------------------------------

// Inheritance

class BodyPart {
    var name: String = "BodyPart"
    
    var type: String {
        get {
            return "generic body part"
        }
        set {
            
        }
    }
    func printData () {
        print("My \(name) is a \(type)")
    }
}

class Hand: BodyPart {
    override var type: String {
        get {
            return "limb"
        }
        set {
            
        }
    }
    
    // Stored properties can be overridden with property observers
    override var name: String {
        willSet {
            print("I am changing from \(name) to \(newValue)")
        }
        didSet {
            print("I have changed to \(name) from \(oldValue)")
        }
    }
}

var handPart = Hand()
handPart.name = "Prashanth"
handPart.type

// --------------------------------------------------------------

// Optionals

struct Stats {
    var height: Double = 0
    var weight: Double = 0
}

class Body {
    var stats1:Stats = Stats()
    var stats2:Stats?
    var stats3:Stats!
}

var test = Body()
test.stats1.height
test.stats2?.height
test.stats3?.height

// --------------------------------------------------------------

class Animal {
    init() {
    }
}

class TerrestrialAnimal: Animal {
    var name: String
    var age: Int
    
    init(name:String, age: Int) {
        self.name = name
        self.age = age
        super.init()
    }
    
    convenience init(name: String) {
        self.init(name:name, age: 10)
    }
}

/*
Designated/Convenience initialiser
Rule 1: A designated initialiser must call a designated initialiser from its parent class, unless it is a base class
Rule 2: A convenience initialiser must call an initialiser from the same class and not from a parent
Rule 3: A convenience initialiser must ultimately call a designated initialiser from same class
Rule 4: Convenience initaliser cannot be overridden
*/

// --------------------------------------------------------------

class Country {
    var name: String = ""
    
    init() {
        
    }
    
    init (name: String) {
        
    }
    
    convenience init(firstName: String, lastName: String) {
        let fullName = firstName + " " + lastName
        self.init(name: fullName)
    }
}

class State: Country {
    
}

class City: Country{
    
    // Overriding designaged initialiser of parent class
    override init(name:String) {
        super.init(name:name)
        self.name = name
    }
}

class Area: Country {
    override init() {
        super.init()
    }
    
    override init(name: String) {
        super.init(name: name)
        self.name = name
    }
}

Country() // has all the initalisers

// Rule 1: A designated initialiser must call a designated initialiser from its parent class, unless it is a base class
State() // Also has all the initialsers of parent as this doenst have its own initalisers

// Rule 2: A convenience initialiser must call an initialiser from the same class and not from a parent
City(name: "") // has just its own overridden designated initialisers but not of parents

// Rule 3: A convenience initialiser must ultimately call a designated initialiser from same class
Area() // Since this has overridden all the designated initialisers it gets the parents convieninece initialser as well

// --------------------------------------------------------------

// Required initialser

class Automobile {
    init() {
    }
    // Force subclasses to implement this init!
    required init(name: String) {
    }
}

class Company: Automobile {
    override init() {
        super.init()
    }
    required init(name: String) {
        super.init(name: name)
    }
}

// --------------------------------------------------------------

//Failable initialiser

class Automobile1 {
    init() {
        
    }
    
    // Failable init is denoted by optional; subclasses will also get failable init!
    init?(numberOfWheels: Int) {
        if (numberOfWheels<0 && numberOfWheels>10) {
            return nil
        }
    }
}

class Company1: Automobile1 {
    override init() {
        super.init()
    }
    
    override init?(numberOfWheels: Int) {
        super.init(numberOfWheels: numberOfWheels)
    }
}

// --------------------------------------------------------------

// Deinit illustrator: Deinit is called when instance is set to nil

struct HealthData {
    static var caloricIntake:Int = 0
    static var caloricOutgoing: Int = 0
    static var caloricSurplus: Int {
        get {
            return caloricIntake - caloricOutgoing
        }
    }
}

class Day {
    var caloricIntake: Int = 0
    var caloricOutgoing: Int = 0
    var caloricSurplus: Int {
        get{
            return caloricIntake - caloricOutgoing
        }
    }
    
    func doExercise(caloriesToBurn: Int) {
        caloricOutgoing += caloriesToBurn
    }
    
    func eatSomething(caloriesToGain: Int) {
        caloricIntake += caloriesToGain
    }
    
    deinit {
        HealthData.caloricIntake += caloricIntake
        HealthData.caloricOutgoing += caloricOutgoing
    }
}

var day1:Day? = Day()
day1?.doExercise(caloriesToBurn: 100)
day1?.eatSomething(caloriesToGain: 200)
day1 = nil // Deinit called

print(HealthData.caloricSurplus)

var day2:Day? = Day()
day2?.doExercise(caloriesToBurn: 500)
day2?.eatSomething(caloriesToGain: 200)
day2 = nil // Deinit called

print(HealthData.caloricSurplus)

var day3:Day? = Day()
day3?.doExercise(caloriesToBurn: 500)
day3?.eatSomething(caloriesToGain: 700)
day3 = nil // Deinit called

print(HealthData.caloricSurplus)

class TestGuard {
    func guardTest() {
    let price = 10
    guard price <= 9 else {
        print("price is \(price)")
        return
    }
}
}

let gt = TestGuard()
gt.guardTest()


class Singleton {
    static let sharedInstance: Singleton = {
        let instance = Singleton()
        // setup code
        return instance
    }()
}

let s1 = Singleton.sharedInstance
let s2 = Singleton.sharedInstance
if (s1 === s2) {
    print(s1, s2)
}
