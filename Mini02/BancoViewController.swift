//
//  BancoViewController.swift
//  Mini02
//
//  Created by Gabriel Rodrigues da Silva on 06/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class BancoViewController: UIViewController {
    
    //Banco
    @IBOutlet weak var SaldoBanco: UILabel!
    @IBOutlet weak var SaldoPoupanca: UILabel!
    
    //Poupança
    @IBOutlet weak var SaldoLabel: UILabel!
    @IBOutlet weak var SaldoDisponivel: UILabel!
    @IBOutlet weak var GuardarTextField: UITextField!
    @IBOutlet weak var RetirarTextField: UITextField!
    
    var banco = Personagem().mexerDinheiro(valor: nil)
    var valor: String!
    var valor2: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        atualizarLabel()
        GuardarTextField?.attributedPlaceholder = NSAttributedString(string: "0,00", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        RetirarTextField?.attributedPlaceholder = NSAttributedString(string: "0,00", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        GuardarTextField?.delegate = self
        RetirarTextField?.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(atualizarSaldo(n:)), name: NSNotification.Name.init("AtualizarSaldo"), object: nil)
        
    }
    
    @objc func atualizarSaldo(n:NSNotification) {
        atualizarLabel()
        banco = Personagem().mexerDinheiro(valor: nil)
    }
    
    @IBAction func ConfirmarButton(_ sender: Any) {
        
                
        if (GuardarTextField.hasText) {
            valor = GuardarTextField.text?.replacingOccurrences(of: ",", with: ".")
            let total = (valor as NSString).floatValue
            
            if (total <= banco!) {
                 _ = Personagem().mexerDinheiro(valor: -total)
                 _ = Personagem().poupanca(valor: total)
                GuardarTextField.text = ""
                NotificationCenter.default.post(name: NSNotification.Name.init("AtualizarSaldo"), object: nil)

                
            } else {
                let alert = UIAlertController(title: "Saldo insuficiente", message: nil, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
                alert.addAction(cancelAction)
                self.present(alert, animated: true, completion: nil)
            }
            
        } else if(RetirarTextField.hasText) {
            valor2 = RetirarTextField.text?.replacingOccurrences(of: ",", with: ".")
            let total2 = (valor2 as NSString).floatValue
            let poup = Personagem().poupanca(valor: nil)
            
            if (total2 <= poup!) {
                 _ = Personagem().mexerDinheiro(valor: total2)
                 _ = Personagem().poupanca(valor: -total2)
                RetirarTextField.text = ""
                NotificationCenter.default.post(name: NSNotification.Name.init("AtualizarSaldo"), object: nil)

                
            } else {
                RetirarTextField.clearsOnBeginEditing = true
                let alert = UIAlertController(title: "Saldo da poupança insuficiente", message: nil, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
                alert.addAction(cancelAction)
                self.present(alert, animated: true, completion: nil)
            }
            
        } else {
           
        }
    }
    
    func atualizarLabel() {
        let saldoConta = Personagem().mexerDinheiro(valor: nil)
        let poupanca = Personagem().poupanca(valor: nil)
        
        SaldoBanco?.text = "R$ " + String(format: "%.2f", saldoConta!).replacingOccurrences(of: ".", with: ",")
        SaldoPoupanca?.text = "R$ " + String(format: "%.2f", poupanca!).replacingOccurrences(of: ".", with: ",")
        SaldoLabel?.text = String(format: "%.2f", poupanca!).replacingOccurrences(of: ".", with: ",")
        SaldoDisponivel?.text = "Saldo disponível: R$ " + String(format: "%.2f", saldoConta!).replacingOccurrences(of: ".", with: ",")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        GuardarTextField?.resignFirstResponder()
        RetirarTextField?.resignFirstResponder()
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        valor = textField.text?.replacingOccurrences(of: ",", with: ".")
        let total = (valor as NSString).floatValue
        if(total > banco!) {
            if (GuardarTextField.hasText) {
                SaldoDisponivel.textColor = .red

            }
            
        } else {
            SaldoDisponivel.textColor = .white
        }
    }

}


extension BancoViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
