

import Foundation

class UnitConverter {
    
    func degreesFahrenheit(degreesCelsius: Int) -> Int {
        return Int(1.8 * Float(degreesCelsius) + 32.0)
    }
    
}
