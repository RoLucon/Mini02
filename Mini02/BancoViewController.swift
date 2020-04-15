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
    
    //Dicas
    enum Segues {
        static let dicaFatura = "dicaFatura"
        static let dicaConta = "dicaConta"
        static let dicaBanco = "dicaBanco"
        static let dicaPoupanca = "dicaPoupanca"
    }


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
    
    @IBAction func BackButton(_ sender: Any) {
        let nome = Notification.Name(rawValue: atualizaFalaNotificationKey)
        NotificationCenter.default.post(name: nome, object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func ConfirmarButton(_ sender: Any) {
        
            let nome = Notification.Name(rawValue: atualizaFalaNotificationKey)
            NotificationCenter.default.post(name: nome, object: nil)
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
    }
    

}


extension BancoViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
        //view.backgroundColor = .red
        /*let blurEffect = UIBlurEffect(style: .regular)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        view.addSubview(visualEffectView)
        view = visualEffectView*/
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
