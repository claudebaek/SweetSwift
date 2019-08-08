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
        
        let formatter = DateFormatter()    // DateFormatter 클래스의 인스턴스를 만들고
        formatter.timeStyle = .short      // 시간표시 스타일을 ShortStyle 로 지정한다.
        currentTime.text = formatter.string(from: clock.date)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateTimeLabel), name: NSNotification.Name("fore"), object: nil)
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimeLabel() {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        currentTime.text = formatter.string(from: clock.comDate)
    }
    
    deinit {
        print("deinit")
    }
}



