//: Playground - noun: a place where people can play

import UIKit
// A simple protocol, actually a delegate
protocol FoodPriceProtocol{
    func price(pricePerUnit:Double) -> Double
}

//The abstract pizza base class
class AbstractPizza { //our Abstract pizza Class
    let pizzaPi = 3.14
    var size:Double! = nil  // Nil helps indicate empty
    var crust:AnyObject! = nil
    var topping:[String]! = nil
    init(){ //use an empty method to initialize values
        pizzaDidLoad()
    }
    class func personalPizza() -> AnyObject!{  //AnyObject helps subclass
        let pizza = AbstractPizza()
        pizza.size = 10.0
        pizza.topping = ["Pizza Sauce","Cheese"]
        pizza.crust = "White" as AnyObject!
        return pizza
    }
    func area() -> Double! {  //Abstract functions often return nil
        return nil            // to indicate empty
    }
    func pizzaDidLoad(){
        //empty method for initialization
    }
}

// FlatPizza -- demonstrating the basic subclassing of a abstract class
//Also demonstrates protocol adoption
class FlatPizza:AbstractPizza,FoodPriceProtocol{ //flat round pizza
    //define area
    override func area() -> Double! {
        let radius = size / 2.0
        return radius * radius * pizzaPi
    }
    //set default values for properties
    override func pizzaDidLoad() {
        size = 10.0
        crust = "White" as AnyObject!
        topping = ["Pizza Sauce","Cheese"]
    }
    //protocol
    func price(pricePerUnit: Double) -> Double {
        return area() * pricePerUnit
    }
}

//PanPizza -- demonstrate adding a property and methods with optional chaining
class PanPizza:AbstractPizza{
    var depth = 0.0
    override func area() -> Double! {
        if let currentSize = size{
            let radius = currentSize / 2.0
            return radius * radius * pizzaPi
        }else{
            return nil
        }
    }
    func volume() -> Double!{
        if let area = area() {
            return area * depth
        }else{
            return nil
        }
    }
}
// Demonstring overriding properties, or not...
class RectPizza:AbstractPizza{
    struct PizzaDimension{ //a struct for the height and width of a rectangle
        var height:Double = 0.0
        var width:Double = 0.0
    }
    //this does not work -- we cant overrride type of a property
    //var size:PizzaDimension = PizzaDimension()
    //added property sizeRect
    var sizeRect = PizzaDimension()
    override func area() -> Double! {
        return sizeRect.height * sizeRect.width
    }
    override func pizzaDidLoad() {
        sizeRect.height = 10.0
        sizeRect.width = 12.0
        crust = "Wheat" as AnyObject!
        topping = ["Pizza Sauce","Cheese","Mushroom"]
    }
}
//Subclassing a subclass that used an abstract class
class FlatBreadPizza:RectPizza{
    override func area() -> Double!{
        let rect = (sizeRect.height - sizeRect.width) * sizeRect.width //area with round parts removed to make a rectangle
        let radius = sizeRect.width / 2.0
        let circle = radius * radius * pizzaPi
        return rect + circle
    }
}
//Demonstrating class methods and AnyObject!
//Also Demonstrates protocol adoption
class BowlPizza:AbstractPizza,FoodPriceProtocol{ //protocol adoption
    override class func personalPizza() -> AnyObject! {
        let pizza = super.personalPizza() as! AbstractPizza
        let bowlPizza = BowlPizza()
        bowlPizza.size = pizza.size
        bowlPizza.topping = pizza.topping
        bowlPizza.crust = pizza.crust
        return bowlPizza
    }
    
    func volume() -> Double!{
        if let bowlSize = size {
            let radius = bowlSize / 2.0
            return radius * radius * radius * pizzaPi * (2.0/3.0) //volume of half a sphere
        } else {
            return nil
        }
    }
    //Protocols (delegates and Data sources)
    func price(pricePerUnit: Double) -> Double {
        if pricePerUnit == 1.0 {
            return 23.50
        } else if pricePerUnit == 0.5 {
            return 11.75
        } else {
            return 0
        }
    }
}
//An example of a data source
protocol ChocolateChipCookieDataSource{
    func numberOfChipsPerCookie() -> Int
    func bagOfCookiesCount() -> Double
}

//examples of delegates and data sources with a different class
// no superclass here, so the protocols goes directly after the class declaration
// If there is a superclass, like aboove, the superclass goes first in the list.

class ChocolateChipCookie:FoodPriceProtocol,ChocolateChipCookieDataSource{
    var chipCount = 0
    func price(pricePerUnit: Double) -> Double {
        //return price pricePerUnit * Double(chipCount)
        return pricePerUnit * Double(numberOfChipsPerCookie())
    }
    func numberOfChipsPerCookie() -> Int { //simple datasource which returns a value
        return 15
    }
    func bagOfCookiesCount() -> Double { //datasource whihc calcualtes its value
        //return 10.0
        //get more cookies differnt days of the week
        let now = NSDate.timeIntervalSinceReferenceDate //get the number of seconds from refrence date to now
        let dayInSeconds:Double = 60 * 60 * 24 //convert to days
        let day = Int(now / dayInSeconds) % 7 // convert to day of week as 0 - 6
        return Double(day) + 5.0 //five plus however many cookies for the day
    }
    func bagOfCookiesPrice(cookieCount:Double) -> Double{ //using the protocol method
        return price(pricePerUnit: 0.05) * cookieCount
    }
    func bagOfCookiesPrice() -> Double{ //using the protocol method in two different classes
        let pricePerUnit = 0.05
        let pizza = FlatPizza()
        let discount = (pizza.price(pricePerUnit: pricePerUnit) * 0.10)
        return discount * price(pricePerUnit: pricePerUnit) * bagOfCookiesCount()
    }
}

// test area
let flatRoundPizza = FlatPizza()
flatRoundPizza.area()
flatRoundPizza.price(pricePerUnit: 0.05)

let panPizza = PanPizza()
panPizza.size = 10.0
panPizza.depth = 2.0
panPizza.volume()

let rectanglePizza = RectPizza()
rectanglePizza.area()

let bowlPizza = BowlPizza.personalPizza() as! BowlPizza
bowlPizza.size
bowlPizza.volume()
bowlPizza.price(pricePerUnit: 1.0)
bowlPizza.price(pricePerUnit: 0.5)
bowlPizza.price(pricePerUnit: 1.1)

let cookie = ChocolateChipCookie()
cookie.price(pricePerUnit: 0.05)
cookie.bagOfCookiesPrice(cookieCount: 5)