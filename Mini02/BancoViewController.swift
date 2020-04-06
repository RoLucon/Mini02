//
//  BancoViewController.swift
//  Mini02
//
//  Created by Gabriel Rodrigues da Silva on 06/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class BancoViewController: UIViewController {
    
    
    //Poupança
    @IBOutlet weak var SaldoLabel: UILabel!
    @IBOutlet weak var GuardarTextField: UITextField!
    @IBOutlet weak var RetirarTextField: UITextField!
    
    var poup = 1000.00
    var grdr = 200.00
    var valor:String!
    var valor2:String!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        GuardarTextField?.attributedPlaceholder = NSAttributedString(string: "0,00", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        RetirarTextField?.attributedPlaceholder = NSAttributedString(string: "0,00", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        GuardarTextField?.delegate = self
        RetirarTextField?.delegate = self
        
    }
    
    @IBAction func ConfirmarButton(_ sender: Any) {
        
        if (GuardarTextField.hasText) {
            valor = GuardarTextField.text?.replacingOccurrences(of: ",", with: ".")
            let total = poup + (valor as NSString).doubleValue
            SaldoLabel.text = String(format: "%.2f", total).replacingOccurrences(of: ".", with: ",")
            
        } else if(RetirarTextField.hasText) {
            valor2 = RetirarTextField.text?.replacingOccurrences(of: ",", with: ".")
            let total2 = poup - (valor2 as NSString).doubleValue
            SaldoLabel.text = String(format: "%.2f", total2).replacingOccurrences(of: ".", with: ",")
            
        } else {
           
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        GuardarTextField?.resignFirstResponder()
        RetirarTextField?.resignFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension BancoViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
