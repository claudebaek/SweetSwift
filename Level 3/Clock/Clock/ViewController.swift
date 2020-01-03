//
//  ViewController.swift
//  Clock
//
//  Created by Claude,Baek on 08/10/2017.
//  Copyright © 2017 Revival. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTime: UILabel!
    let clock = Clock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTimeLabel()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateTimeLabel), name: Notification.Name("fore"), object: nil)
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimeLabel() {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        currentTime.text = formatter.string(from: clock.currentDate)
    }
    
    deinit {
        print("deinit")
    }
}



