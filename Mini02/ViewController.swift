//
//  ViewController.swift
//  Mini02
//
//  Created by Rogerio Lucon on 27/03/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var dindin = 100.00
    
    @IBOutlet weak var dinheiro: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
        @IBAction func Add(_ sender: Any) {
            
            let din : String = "R$"+String(dindin)+"0 "
            dinheiro.text = din
            dindin += 100.00
        
    }

}
