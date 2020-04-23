//
//  UILabel.swift
//  Mini02
//
//  Created by Rogerio Lucon on 07/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class TextLabel: UILabel {
    var texto = "" {didSet {
        counter = 0
        text = ""
        typeWriter()
        }}
    var counter = 0
    var timer: Timer?
    var humamMode: Bool = true
    var speed: Double = 20 {didSet {speed = speed * 10}}
    
    @objc func typeWriter(){
        var interval = speed * 0.006
        if counter < texto.count {
            let array = Array(texto)
            self.text = self.text! + String(array[counter])
            if humamMode {
                interval = Double.random(in: 1...8) / (speed * 2)
            }
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(interval), target: self, selector: #selector(typeWriter), userInfo: nil, repeats: true)
        } else {
            timer?.invalidate()
        }
        counter += 1
    }
}
