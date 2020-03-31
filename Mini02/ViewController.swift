//
//  ViewController.swift
//  Mini02
//
//  Created by Rogerio Lucon on 27/03/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var dindin = 0.00
    
    
    @IBOutlet weak var FalaPrsonagem: UITextView!
    
    @IBOutlet weak var dinheiro: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaSaldo()
        // Do any additional setup after loading the view.
    }

    func atualizaSaldo(){
        dinheiro.text = "R$"+String(dindin)+"0 "
    }
    
    @IBAction func DigaOi(_ sender: UIButton) {
        
        FalaPrsonagem.text=" Oi, Eu sou o Kleytinho"
    }
    

}
