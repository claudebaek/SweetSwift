
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    let stopwatch = Stopwatch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startButtonTapped(sender: UIButton) {
        Timer.scheduledTimer(timeInterval: 0.1, target: self,
                             selector: #selector(updateElapsedTimeLabel), userInfo: nil, repeats: true)
        stopwatch.start()
    }
    
    @IBAction func stopButtonTapped(sender: UIButton) {
        stopwatch.stop()
    }
    
   @objc func updateElapsedTimeLabel(timer: Timer) {
        if stopwatch.isRunning {
            elapsedTimeLabel.text = stopwatch.runningTimeAsString
        } else {
            timer.invalidate()
        }
    }
    
}


