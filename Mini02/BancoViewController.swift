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
    @IBOutlet weak var nome: UILabel!
    
    //Banco História
    @IBOutlet weak var saldoConta: UIView!
    @IBOutlet weak var poupancaView: UIView!
    @IBOutlet weak var Investimento: UIButton!
    @IBOutlet weak var Contas: UIButton!
    @IBOutlet weak var Extrato: UIButton!
    @IBOutlet weak var fundoView: UIView!
    @IBOutlet weak var StackView: UIStackView!
    @IBOutlet weak var seta: UIImageView!
    @IBOutlet weak var textoLabel: UILabel!
    @IBOutlet weak var faturaView: UIView!
    @IBOutlet weak var textoView: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    var banco = Personagem.shared.mexerDinheiro(valor: nil)
    var personagem: Personagem = Personagem.shared

    
    enum Segues {
        static let dicaFatura = "dicaFatura"
        static let dicaConta = "dicaConta"
        static let dicaBanco = "dicaBanco"
        static let guardarPoupanca = "poupGuardar"
        static let retirarPoupanca = "poupRetirar"
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if prog == 1 && contadorBanco >= 1 {
            fundoView?.isHidden = false
            textoView?.isHidden = false
            poupancaView?.transform = CGAffineTransform(translationX: 0, y: -20)
            StackView?.transform = CGAffineTransform(translationX: 0, y: -90)
            Extrato?.transform = CGAffineTransform(translationX: 0, y: -130)
            textoLabel?.text = texto2[1]!
            backButton?.isEnabled = false
        }

        // Do any additional setup after loading the view.
        nome?.text = personagem.nome!
        atualizarLabel()
        observer()
    }
    func observer(){
        NotificationCenter.default.addObserver(self, selector: #selector(atualizarSaldo(n:)), name: NSNotification.Name.init("AtualizarSaldo"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(proximoTexto(_:)), name: NSNotification.Name.init("AtualizarFala"), object: nil)
    }
    
    @objc func atualizarSaldo(n:NSNotification) {
        atualizarLabel()
        banco = Personagem.shared.mexerDinheiro(valor: nil)
    }
    
    @IBAction func BackButton(_ sender: Any) {
        let nome = Notification.Name(rawValue: atualizaFalaNotificationKey)
        NotificationCenter.default.post(name: nome, object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    func atualizarLabel() {
        let saldoConta = Personagem.shared.mexerDinheiro(valor: nil)
        let poupanca = Personagem.shared.poupanca(valor: nil)
        
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
        if segue.identifier == Segues.retirarPoupanca {
            let destVC = segue.destination as! PoupancaView
            destVC.action = "retirar"
            destVC.saldo = Personagem.shared.poupanca(valor: nil)!
        }
        if segue.identifier == Segues.guardarPoupanca {
            let destVC = segue.destination as! PoupancaView
            destVC.action = "guardar"
            destVC.saldo = Personagem.shared.mexerDinheiro(valor: nil)!
        }
    }
    
    //História - Capítulo 1
    
    @IBAction func teste(_ sender: Any) {
        fundoView?.isHidden = false
    }
    
    @objc func fundoV(){
        fundoView?.isHidden = false
        print("ok...")

    }
    
    @IBAction func proximoTexto(_ sender: Any) {
        contadorBanco += 1
        textoLabel?.text = texto2[contadorBanco]!
        
        switch  contadorBanco {
        case 3:
            view.addSubview(saldoConta)
        case 4:
            view.sendSubviewToBack(saldoConta)
            view.addSubview(poupancaView)
            //seta?.center.x += 250
            //seta?.center.y -= 390
        case 6:
            seta?.isHidden = false
            //seta?.center.x -= 250
            //seta?.center.y += 390
        case 7:
            view.sendSubviewToBack(poupancaView)
            seta?.isHidden = true
            view.addSubview(StackView)
            Contas.alpha = 0.5
            Investimento?.isEnabled = false
        case 9:
            Investimento.alpha = 0.5
            Contas.alpha = 1
            seta?.isHidden = false
            seta?.center.x += 190
            seta?.center.y += 130
        case 12:
            view.sendSubviewToBack(StackView)
            seta?.isHidden = true
            Investimento.alpha = 1
        case 13:
            view.addSubview(Extrato)
        case 19:
            fundoView?.isHidden = true
            contadorBanco = 0
            Investimento.alpha = 1
            poupancaView?.transform = .identity
            StackView?.transform = .identity
            Extrato?.transform = .identity
            backButton?.isEnabled = true
        default:
            print("ok")
            //view.sendSubviewToBack(Extrato)
        }

    }
    
    @IBAction func voltarTexto(_ sender: Any) {
        if contadorBanco > 1 && contadorBanco <= 15 {
            contadorBanco -= 1
            textoLabel?.text = texto2[contadorBanco]!
        }
    }

    //História - Capítulo 2

    @IBAction func voltarFase(_ sender: Any) {
        contadorBanco += 1
        NotificationCenter.default.post(name: NSNotification.Name.init("AtualizarView"), object: nil)
        if prog == 2 {
            let nome = Notification.Name(rawValue: atualizaSetaBancoNotificationKey)
            NotificationCenter.default.post(name: nome, object: nil)
            self.dismiss(animated: true, completion: nil)
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
    var banco = Personagem.shared.mexerDinheiro(valor: nil)
    var poupanca = Personagem.shared.poupanca(valor: nil)
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
                 _ = Personagem.shared.mexerDinheiro(valor: -total)
                 _ = Personagem.shared.poupanca(valor: total)
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
            let poup = Personagem.shared.poupanca(valor: nil)
            
            if (total2 <= poup!) {
                 _ = Personagem.shared.mexerDinheiro(valor: total2)
                 _ = Personagem.shared.poupanca(valor: -total2)
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
