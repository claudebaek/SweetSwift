//: [Previous](@previous)

import UIKit

var str = "Hello, playground"

//: [Next](@next)

class Music {
    var title: String
    init(title: String) {
        self.title = title
    }
}


class Classic: Music {
    var composer: String
    init(title: String, composer: String) {
        self.composer = composer
        super.init(title: title)
    }
}

class Hiphop: Music {
    var rapper: String
    init(title: String, rapper: String) {
        self.rapper = rapper
        super.init(title: title)
    }
}

let classic = Classic.init(title: "Canon", composer: "Pachelbel")
let hiphop = Hiphop.init(title: "Lose Yourself", rapper: "Eminem")
let music = Music.init(title: "Music")

let c = music as? Classic


let playList = [classic, hiphop]
let f = playList.first as? Classic

let first = playList[0] as? Classic
let second = playList[1] as? Classic


print(first?.composer)

classic is Classic
classic is Music
classic is Hiphop

for item in playList {
    if let classic = item as? Classic {
        print("Classic: \(classic.title), made \(classic.composer)")
    } else if let hiphop = item as? Hiphop {
        print("Hiphop: \(hiphop.title), by \(hiphop.rapper)")
    }
}


 //

//for item in playList {
//    if item is Classic {
//        print("Classic")
//    } else if item is Hiphop {
//        print("Hiphop")
//    }
//}


var namesOfIntegers: [Int: String] = [:]


let cities = ["Seoul", "Newyork", "Paris"]

func test(a : String) -> String {
    return "Beautiful \(a)"
}

cities.map(test)

let newCities = cities.map { "Beautiful " + $0 }

print(newCities)


class MyClass {
    var str = "I'm a Class"
}

let classA = MyClass()
let classB = classA
classB.str = "Hello"
print(classA.str)



struct MyStruct {
    var str = "I'm a Struct"
}

var structA = MyStruct()
var structB = structA
structB.str = "Hello"
print(structA.str)



let test = 1

enum nationType : Int {      // rawValue의 타입을 Int로 지정한 것이다
    case Korea       // 값을 설정하지 않을경우 기본값인 0부터 차례대로 증가한다
    case Tokyo
    case France = 10         // rawValue의 값을 10으로 설정했다
}

print(nationType.Korea.rawValue)



let someClosure: () -> () = {
    print("test")
}


someClosure()


class Receiver {
    
    var closures = [() -> ()]()
    
    func doWithClosure(param:  @escaping () -> (), completion: () -> ()) {
        closures.append(param)
        for i in 1...10 {
            print(i)
        }
        completion()
    }
}

let r = Receiver()



protocol someProtocol {
    func doSome()
}

class TestClass {
    func doSome() {
            print("doSome")
    }
}

