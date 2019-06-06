

import Foundation

class Stopwatch {
    
    private var startTime: Date?

    var runningTime: TimeInterval {
        if let startTime = self.startTime {
            return -startTime.timeIntervalSinceNow
        } else {
            return 0
        }
    }
    
    var runningTimeAsString: String {
        return String(format: "%02d:%02d.%d",
            Int(runningTime / 60), Int(runningTime) % 60, Int(runningTime * 10) % 10)
    }
    
    var isRunning: Bool {
        return startTime != nil
    }
    
    func start() {
        startTime = Date()
    }
    
    func stop() {
        startTime = nil
    }
    
}
