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
        typeWriter()
        }}
    var counter = 0
    var timer: Timer?
    
    @objc func typeWriter(){
        if counter < texto.count {
            let array = Array(texto)
            self.text = self.text! + String(array[counter])
            let interval = Double((arc4random_uniform(8) + 1)) / 20
            timer?.invalidate()
            timer = Timer.scheduledTimer(timeInterval: TimeInterval(interval), target: self, selector: #selector(typeWriter), userInfo: nil, repeats: true)
        } else {
            timer?.invalidate()
        }
        counter += 1
    }
}
