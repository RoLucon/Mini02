//
//  CustomizacaoViewController.swift
//  Mini02
//
//  Created by Rogerio Lucon on 30/03/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class CustomizacaoViewController: UIViewController {
    
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var previous: UIButton!
    @IBOutlet weak var nextBtt: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var confirmBtt: UIButton!
    
    let images = ["user0", "user1", "user2"]
    
    var index = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        confirmBtt.isEnabled = false
        
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
    
    @IBAction func confirm(_ sender: Any) {
        
    }
    
    @IBAction func Changed(_ sender: Any) {
        if txtField.isFirstResponder {
            if txtField.text!.rangeOfCharacter(from: CharacterSet.letters.inverted) != nil {
                let attString: String = String(txtField.text?.dropLast() ?? "")
                txtField.text = attString
            }

        }
    }
    
    @IBAction func txtFieldDidChange(_ sender: Any) {
        confirmBtt.isEnabled = false
        if self.txtField.text!.count >= 3 {
            confirmBtt.isEnabled = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
