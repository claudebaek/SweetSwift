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
        
    }
}

