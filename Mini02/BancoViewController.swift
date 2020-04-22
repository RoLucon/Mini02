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


    var banco = Personagem().mexerDinheiro(valor: nil)
    
    enum Segues {
        static let dicaFatura = "dicaFatura"
        static let dicaConta = "dicaConta"
        static let dicaBanco = "dicaBanco"
        static let dicaPoupanca = "dicaPoupanca"
        static let guardarPoupanca = "poupGuardar"
        static let retirarPoupanca = "poupRetirar"
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        atualizarLabel()
        NotificationCenter.default.addObserver(self, selector: #selector(atualizarSaldo(n:)), name: NSNotification.Name.init("AtualizarSaldo"), object: nil)
    }
    
    @objc func atualizarSaldo(n:NSNotification) {
        atualizarLabel()
        banco = Personagem().mexerDinheiro(valor: nil)
    }
    
    @IBAction func BackButton(_ sender: Any) {
        let nome = Notification.Name(rawValue: atualizaFalaNotificationKey)
        NotificationCenter.default.post(name: nome, object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    func atualizarLabel() {
        let saldoConta = Personagem().mexerDinheiro(valor: nil)
        let poupanca = Personagem().poupanca(valor: nil)
        
        SaldoBanco?.text = "R$ " + String(format: "%.2f", saldoConta!).replacingOccurrences(of: ".", with: ",")
        SaldoPoupanca?.text = "R$ " + String(format: "%.2f", poupanca!).replacingOccurrences(of: ".", with: ",")
    }
            
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.dicaFatura {
            let destVC = segue.destination as! DicasView
            destVC.fatura = "ToFirstChild"
        }
        if segue.identifier == Segues.dicaConta {
            let destVC = segue.destination as! DicasView
            destVC.contas = "ToFirstChild"
            
        }
        if segue.identifier == Segues.dicaBanco {
            let destVC = segue.destination as! DicasView
            destVC.banco = "ToFirstChild"
        }
        if segue.identifier == Segues.dicaPoupanca {
            let destVC = segue.destination as! DicasView
            destVC.poupanca = "ToFirstChild"
        }
        if segue.identifier == Segues.retirarPoupanca {
            let destVC = segue.destination as! PoupancaView
            destVC.action = "retirar"
            destVC.saldo = Personagem().poupanca(valor: nil)!
        }
        if segue.identifier == Segues.guardarPoupanca {
            let destVC = segue.destination as! PoupancaView
            destVC.action = "guardar"
            destVC.saldo = Personagem().mexerDinheiro(valor: nil)!
        }
    }
    

}

extension PoupancaView : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

class PoupancaView: UIViewController {
    
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var SaldoDisponivel: UILabel!
    @IBOutlet weak var ValorTextField: UITextField!
    
    var saldo: Float = 0
    var banco = Personagem().mexerDinheiro(valor: nil)
    var poupanca = Personagem().poupanca(valor: nil)
    var valor: String!
    var valor2: String!
    
    var action = "xxxx"
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionLabel.text = action
        SaldoDisponivel?.text = "Saldo disponível: R$ " + String(format: "%.2f", saldo).replacingOccurrences(of: ".", with: ",")
        ValorTextField?.delegate = self
        observer()
    }
    func observer(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func keyboardShow(notification: NSNotification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            if let duration = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double {
                
                UIView.animate(withDuration: duration){
                    let bounds = UIScreen.main.bounds
                    self.view.frame = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width, height: bounds.height - keyboardSize.height)
                    self.view.layoutIfNeeded()
                }
            }
        }
    }
    @objc func keyboardHide(notification: NSNotification){
        if let duration = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Double {
            UIView.animate(withDuration: duration){
                self.view.frame = UIScreen.main.bounds
                self.view.layoutIfNeeded()
            }
        }
    }
    
    
    @IBAction func ConfirmarButton(_ sender: Any) {
      
            if (ValorTextField.hasText && action == "guardar") {
            valor = ValorTextField.text?.replacingOccurrences(of: ",", with: ".")
            let total = (valor as NSString).floatValue
            
            if (total <= banco!) {
                 _ = Personagem().mexerDinheiro(valor: -total)
                 _ = Personagem().poupanca(valor: total)
                NotificationCenter.default.post(name: NSNotification.Name.init("AtualizarSaldo"), object: nil)
                self.dismiss(animated: true, completion: nil)

                
            } else {
                let alert = UIAlertController(title: "Saldo da conta insuficiente", message: nil, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
                alert.addAction(cancelAction)
                self.present(alert, animated: true, completion: nil)
            }
            
        } else if(ValorTextField.hasText && action == "retirar") {
            valor2 = ValorTextField.text?.replacingOccurrences(of: ",", with: ".")
            let total2 = (valor2 as NSString).floatValue
            let poup = Personagem().poupanca(valor: nil)
            
            if (total2 <= poup!) {
                 _ = Personagem().mexerDinheiro(valor: total2)
                 _ = Personagem().poupanca(valor: -total2)
                NotificationCenter.default.post(name: NSNotification.Name.init("AtualizarSaldo"), object: nil)
                self.dismiss(animated: true, completion: nil)

                
            } else {
                ValorTextField.clearsOnBeginEditing = true
                let alert = UIAlertController(title: "Saldo da poupança insuficiente", message: nil, preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
                alert.addAction(cancelAction)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        ValorTextField?.resignFirstResponder()
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        valor = textField.text?.replacingOccurrences(of: ",", with: ".")
        let total = (valor as NSString).floatValue
        if(total > banco! && action == "guardar") {
            if (ValorTextField.hasText) {
                SaldoDisponivel.textColor = .red
            }
        } else if(total > poupanca! && action == "retirar") {
            if (ValorTextField.hasText) {
                SaldoDisponivel.textColor = .red
            }
        } else {
            SaldoDisponivel.textColor = .black
        }
    }
    
    
}


class DicasView: UIViewController {
    
    enum dicas {
       static let banco = [
                            "nome": "Banco",
                            "desc": "Texto...Banco..."
                          ]
       static let poupanca = [
                                "nome": "Poupança",
                                "desc": "Texto...Poupança..."
                             ]
       static let contas = [
                            "nome": "Contas",
                            "desc": "Texto...Contas..."
                          ]
       static let fatura = [
                            "nome": "Fatura",
                            "desc": "Texto...Fatura..."
                            ]
    }
        
    var fatura: String = "dicaFatura"
    var contas: String = "dicaConta"
    var banco: String = "dicaBanco"
    var poupanca: String = "dicaPoupanca"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .none
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == banco {
            let destVC = segue.destination as! DicasChildView
            destVC.view.backgroundColor = .lightGray
            destVC.tituloLabel?.text = dicas.banco["nome"]!
            destVC.textLabel?.text = dicas.banco["desc"]!
        }
        if segue.identifier == poupanca {
            let destVC = segue.destination as! DicasChildView
            destVC.view.backgroundColor = .darkGray
            destVC.tituloLabel?.text = dicas.poupanca["nome"]!
            destVC.textLabel?.text = dicas.poupanca["desc"]!
        }
        if segue.identifier == contas {
            let destVC = segue.destination as! DicasChildView
            destVC.view.backgroundColor = .yellow
            destVC.tituloLabel?.text = dicas.contas["nome"]!
            destVC.textLabel?.text = dicas.contas["desc"]!
        }
        if segue.identifier == fatura {
            let destVC = segue.destination as! DicasChildView
            destVC.view.backgroundColor = .green
            destVC.tituloLabel?.text = dicas.fatura["nome"]!
            destVC.textLabel?.text = dicas.fatura["desc"]!
        }
    }
    
}


class DicasChildView: UIViewController {
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        tituloLabel?.text = "Padrão"
        textLabel?.backgroundColor = .none
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
