//: Playground - noun: a place where people can play

//            let count = UInt32(guide.cities.count)
//            //  배열의 갯수에 해당하는 정수를 UInt32타입으로 변환하여 count라는 상수를 만든다.
//
//            let index = Int(arc4random_uniform(count))
//            // 내장된 함수를 이용하여 0과 count 사이의 무작위 값을 반환받아 다시 Int 타입으로 변환하여 index 라는 상수에 저장한다.
//
//            let city = guide.cities[index]
//            // cities 배열의 index 값에 해당하는 데이터를 city 상수에 저장한다.
//
//            print("Traveling to \(city.name)..")


class SomeClass {
    static var shared: SomeClass {
        struct Singleton {
            static let instance = SomeClass()
        }
        return  Singleton.instance
    }
    
    static var _shared = SomeClass()
    var myProperty = "hello"
}


let aInstance = SomeClass()
let bInstance = SomeClass()

aInstance.myProperty = "A"
print(aInstance.myProperty)
print(bInstance.myProperty)



//SomeClass.shared.myProperty = "singleton"


let b = SomeClass.shared.myProperty
print(b)



import UIKit


class City {
    
    let name: String
    let description: String
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
    }
}

class TourGuide {
    
    let name: String
    let cities: [City]
    
    init(name: String, city:[City]) {
        self.name = name
        self.cities = city
    }
    
    var randomCity : City?  {          // 이렇게 타입뒤에 ?를 붙여서 옵셔널타입으로 선언한다.
        
        if cities.isEmpty  {                       // 값이 없을때는 조건을 만족하여 nil을 반환
            
            return nil
        } else {
            let index = Int(arc4random_uniform(UInt32(cities.count)))
            return cities[index]
        }
    }
}


class WorldCityTour {
    
    let guide: TourGuide
   
    
    init(guide: TourGuide) {
        
        self.guide = guide
    }
    
    func start() {
        
        sayHello()
        introuduce()
        determineCity(decision: "no")
    }
    
    private func visit(cityName: String) {
        
        for city in guide.cities {    // cities 배열에 총 5개의 엘리먼트가 존재하므로 5번 반복 실행된다.
            if city.name == cityName {    // city의 name 프로퍼티와 cityName 파라미터의 인자와 일치할 경우
                print("Arrived at \(city.name). here is \(city.description)")
            }
        }
    }
    
    private func sayHello() {
        
        print("안녕하세요.저는 백두산이라고 합니다.")
    }
    
    private func introuduce() {
        
        let areaOfKorea = 100032.5 // squre km
        
        print("지금부터 세계도시 여행을 시작하겠습니다.")
        print("여러분이 여행할 도시는 총 \(guide.cities.count)개 입니다.")
        print("현재 한국에 있습니다. 한국의 면적은 \(areaOfKorea)제곱킬로미터 입니다.")
    }
    
    private func determineCity(decision: String = "yes") {
        
        guard decision == "yes" || decision == "no" else {
            print("다시 입력해주세요.")
            return
        }
        
        print("도시를 직접 선택하시겠습니까?")
        
        if decision == "yes" {
            print("여행할 도시를 입력하세요.")
            visit(cityName: "Seoul")
            
        }  else {
            
            print("We will choose the city randomly.")
            
            if let rc = guide.randomCity {
                print("Traveling to.. \(rc.name)")
            } else {
                print("Sorry, but there are no cities.. ")
            }
        }
    }
}

//let seoul = City(name: "Seoul", description: "The capital and largest metropolis of the Republic of Korea")
//let newyork = City(name: "Newyork", description: "A state in the Northeastern United States")
//let paris = City(name: "Paris", description: "The capital and most populous city of France")
//let rome = City(name: "Rome", description: "The capital of Italy and a special comune")
//let london = City(name: "London", description: "The capital and most populous city of England and the United Kingdom")

//var cities = [City]()

var cityDictionay: Dictionary = [
    "Seoul": "The capital and largest metropolis of the Republic of Korea",
    "Newyork" : "A state in the Northeastern United States",
    "Paris" : "The capital and most populous city of France",
    "Rome" : "The capital of Italy and a special comune",
    "London" : "The capital and most populous city of England and the United Kingdom"
]

//for (name,description) in cityDictionay {
//
//    cities.append(City(name: name, description: description))
//}

let cities = cityDictionay.map { City(name: $0, description: $1) }

let guideName = "My tour guide"    // 미리 상수로 선언해두면 변경이 편리하다.
let guide = TourGuide(name: guideName, city: cities)

let tour = WorldCityTour(guide: guide)
//tour.start()






