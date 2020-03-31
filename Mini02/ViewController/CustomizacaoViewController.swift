//
//  CustomizacaoViewController.swift
//  Mini02
//
//  Created by Rogerio Lucon on 30/03/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class CustomizacaoViewController: UIViewController {
    
    @IBOutlet weak var previous: UIButton!
    @IBOutlet weak var nextBtt: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    
    let images = ["user0", "user1", "user2"]
    
    var index = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        imgView.image = UIImage(named: images[index])
        imgView.contentMode = .scaleAspectFill
        
        previous.addTarget(self, action: #selector(previusClick), for: .touchUpInside)
        nextBtt.addTarget(self, action: #selector(nextClick), for: .touchUpInside)
    }
    
    @objc func previusClick(){
        index -= 1
        if index < 0 {
            index = images.count - 1
        }
        imgView.image = UIImage(named: images[index])
    }
    
    @objc func nextClick(){
        index += 1
        if index > images.count - 1 {
            index = 0
        }
        imgView.image = UIImage(named: images[index])
    }
    
}
