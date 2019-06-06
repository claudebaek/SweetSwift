/*

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike
4.0 International License, by Yong Bakos.

*/

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gestureName: UILabel!
    @IBOutlet var singleTapRecognizer: UITapGestureRecognizer!
    @IBOutlet var doubleTapRecognizer: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        singleTapRecognizer.require(toFail: doubleTapRecognizer)
    }

//    override var canBecomeFirstResponder: Bool {
//        return false
//    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            showGestureName(name: "Shake")
        }
    }
    
    func showGestureName(name: String) {
        gestureName.text = name
        UIView.animate(withDuration: 1.0,
                       animations: { self.gestureName.alpha = 1.0 },
                       completion: { _ in
                            UIView.animate(withDuration: 1.0) { self.gestureName.alpha = 0 }
                        
        })
    }
    
    @IBAction func singleTapped(sender: UITapGestureRecognizer) {
        showGestureName(name: "Single Tap")
    }
    
    @IBAction func doubleTapped(_ sender: UITapGestureRecognizer) {
        showGestureName(name: "Double Tap")
    }
    
    
    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .ended {
            showGestureName(name: "Pinch")
        }
    }
  
    
    @IBAction func rotation(sender: UIRotationGestureRecognizer) {
        if sender.state == .ended {
            showGestureName(name: "Rotation")
        }
    }

    @IBAction func swipe(sender: UISwipeGestureRecognizer) {
        if sender.direction == .right {
            showGestureName(name: "Right Swipe")
        }
    }
}

