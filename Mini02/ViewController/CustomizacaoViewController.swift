//
//  CustomizacaoViewController.swift
//  Mini02
//
//  Created by Rogerio Lucon on 30/03/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class CustomizacaoViewController: UIViewController {
    
    @IBOutlet weak var confirma: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        confirma.layer.cornerRadius = confirma.frame.height/2
        confirma.backgroundColor = .lightGray
    }
    
    
}
