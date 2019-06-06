//: [Previous](@previous)

import Foundation

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
let test = classic as Music


for item in playList {
    if let classic = item as? Classic {
        print("Classic: \(classic.title), made \(classic.composer)")
    } else if let hiphop = item as? Hiphop {
        print("Hiphop: \(hiphop.title), by \(hiphop.rapper)")
    }
}




//for item in playList {
//    if item is Classic {
//        print("Classic")
//    } else if item is Hiphop {
//        print("Hiphop")
//    }
//}
