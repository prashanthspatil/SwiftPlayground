//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol SuperHuman {
    func hello()
}

protocol Human: SuperHuman {
    var name: String {get set}
    func helloWorld()
}

extension Human {
    func defaultFunction() {
        print("default function")
    }
}

struct Indian: Human {
    var name: String = "Prashanth"
    func helloWorld() {
            print(name)
    }
    
    func hello() {
        print("Super human")
    }
}

struct Korean: Human {
    var name: String = "Chin chow"
    func helloWorld() {
        print(name)
    }
    
    func hello() {
        print("Super human")
    }
}

var structIndian = Indian()
structIndian.helloWorld()
structIndian.defaultFunction()


var structKorean = Korean()
structKorean.helloWorld()
structKorean.defaultFunction()

// ------------------------------------------------------------------------

protocol Fightable {
    func legKick()
}

struct StructKangroo:Fightable {
    func legKick() {
        print("Struct kangroo")
    }
}

class ClassKangroo: Fightable {
    func legKick() {
        print("Class kangroo")
    }
}

let structKangaroo = StructKangroo()
let classKangaroo = ClassKangroo()

// This is the power of protocol extenions, we could add an struct & class in array!
var kangaroos: [Fightable] = [structKangaroo, classKangaroo]


for kang in kangaroos {
    kang.legKick()
}

// ------------------------------------------------------------------------

protocol Buzzable {}

extension Buzzable where Self: UIView {
    func buzz() { // Animation Logic
        
    }
}
    
protocol Poppable {}

extension Poppable where Self: UIView {
    func pop() { // Pop Animation Logic
        
    }
}

class BuzzableTextField: UITextField, Buzzable {}
class BuzzableButton: UIButton, Buzzable {}
class BuzzableImageView: UIImageView, Buzzable {}
class BuzzablePoppableLabel: UILabel, Buzzable, Poppable {}

class LoginViewController: UIViewController {
    @IBOutlet weak var passcodTextField: BuzzableTextField!
    @IBOutlet weak var loginButton: BuzzableButton!
    @IBOutlet weak var errorMessageLabel: BuzzablePoppableLabel!
    @IBOutlet weak var profileImageView: BuzzableImageView!
    
    @IBAction func didTabLoginButton(_ sender: UIButton) {
        passcodTextField.buzz()
        loginButton.buzz()
        errorMessageLabel.buzz()
        errorMessageLabel.pop()
        profileImageView.buzz()
    }
}
