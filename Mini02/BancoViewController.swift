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
    
    //Teste
    @IBOutlet weak var visualEffectBlur: UIVisualEffectView!
    @IBOutlet weak var poupTeste: UIView!
    @IBOutlet weak var bancoView: UIView!
    @IBOutlet var viewBanco: UIView!
    @IBOutlet weak var effectView: UIView!
    @IBOutlet weak var fundoView: UIView!
    @IBOutlet weak var labelTeste: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var setaImageView: UIImageView!
    
    var num = 0

    
    
    var vfx: UIVisualEffectView!
    var effect: UIVisualEffect!

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
        
        //effect = visualEffectBlur?.effect
        //visualEffectBlur?.effect = nil
        
        //vfx = visualEffectBlur
        //vfx.isHidden = true
        fundoView?.isHidden = true
        setaImageView?.isHidden = true

        // Do any additional setup after loading the view.
        atualizarLabel()
        NotificationCenter.default.addObserver(self, selector: #selector(atualizarSaldo(n:)), name: NSNotification.Name.init("AtualizarSaldo"), object: nil)
    }
    
    func animateIn() {
        fundoView?.isHidden = false
        self.view.addSubview(bancoView)
        bancoView.center = self.view.center
        
        bancoView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        bancoView.alpha = 0
        
        UIView.animate(withDuration: 2, animations: {
            //self.vfx.isHidden = false
            //self.visualEffectBlur.effect = self.effect
            self.bancoView.alpha = 1
            self.bancoView.transform = CGAffineTransform.identity

        }){ (_) in
            self.view.addSubview(self.poupTeste)
            self.view.sendSubviewToBack(self.bancoView)
        }
        
        UIView.animate(withDuration: 2, delay: 2.5, options: .autoreverse, animations: {
            self.poupTeste.transform = CGAffineTransform(translationX: 0, y: -180)

        }) { (_) in
            self.poupTeste.transform = CGAffineTransform.identity
            self.view.sendSubviewToBack(self.poupTeste)
            self.view.addSubview(self.stackView)
        }
        
        UIView.animate(withDuration: 2, delay: 6.5, options: .autoreverse, animations: {
            self.stackView.transform = CGAffineTransform(translationX: 0, y: -480)
        }) { (_) in
            self.stackView.transform = CGAffineTransform.identity
            self.view.sendSubviewToBack(self.stackView)
            self.fundoView.alpha = 0.9
            //self.fundoView.isHidden = true


        }
        
    }
    
    func animateOut() {
        
        self.view.addSubview(poupTeste)

        
        UIView.animate(withDuration: 2, animations: {
        self.view.sendSubviewToBack(self.bancoView)
            
      
            //self.visualEffectBlur.effect = nil
            
        }) { (_) in
            print("aaaaaaaa")
            //self.fundoView?.isHidden = true
            
                  //self.vfx.isHidden = true
            //self.bancoView.removeFromSuperview()
            
            UIView.animate(withDuration: 2) {
                self.poupTeste.transform = CGAffineTransform(translationX: 0, y: -180)
            }
        }
        
        
    }
    
    func animate2()  {
        self.view.sendSubviewToBack(self.bancoView)
        
        UIView.animate(withDuration: 2, delay: 0.1, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            
            self.view.addSubview(self.poupTeste)
            
        }) { (success: Bool) in
            self.poupTeste.center.y -= 180

        }
        
        
    }
    
    @IBAction func teste(_ sender: Any) {
        animateIn()
        
         /*effectView.addSubview(bancoView)
        //bancoView.center = self.view.center
        
        //bancoView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        //bancoView.alpha = 0
        
        UIView.animate(withDuration: 1) {
            self.vfx.isHidden = false
            self.visualEffectBlur.effect = self.effect
            //self.bancoView.alpha = 1
            self.bancoView.transform = CGAffineTransform.identity
        }
        
       UIView.animate(withDuration: 1, animations: {
            self.vfx.isHidden = false
            self.visualEffectBlur.effect = self.effect
            self.bancoView.alpha = 0
            self.bancoView.transform = CGAffineTransform.identity

        }) { (Bool) in
            self.effectView.addSubview(self.poupTeste)
            
            UIView.animate(withDuration: 0.1, animations: {
                //self.vfx.isHidden = true
                //self.visualEffectBlur.effect = nil
            }) { (Bool) in
                //self.viewBanco.addSubview(self.bancoView)
                //self.viewBanco.addSubview(self.poupTeste)

            }
            
            
        }*/
        
        /*vfx.isHidden = false
        vfx.addSubview(bancoView)
        UIView.animate(withDuration: 1, animations: {
            self.poupTeste.frame.origin.y -= 150
        }) { (Bool) in
            UIView.animate(withDuration: 1, animations: {
                self.poupTeste.frame.origin.y += 150
            }) { (Bool) in
                self.vfx.isHidden = true
            }
        }*/
    }
    
    func pulse(duration: TimeInterval = 0.3) {
        UIView.animate(withDuration: 1.5, animations: {
            self.setaImageView?.alpha = 0

        }) { (_) in
            UIView.animate(withDuration: 1.5) {
            self.setaImageView?.alpha = 1

            }
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
        if num == 0 {
            print(num)
            num += 1
            labelTeste.text = "0"
            self.fundoView.alpha = 0.5

        }
        else if num == 1 {
            print(num)
            num += 1
            labelTeste.text = "1"
            self.fundoView.alpha = 0.7
            self.view.addSubview(poupTeste)


        }
        else if num == 2 {
            print(num)
            num += 1
            labelTeste.text = "2"
            self.view.sendSubviewToBack(poupTeste)
            setaImageView?.isHidden = false
            pulse()


            //animateOut()

        }

        
        //animateOut()
        //animate2()
        
        //self.effectView.insertSubview(self.bancoView, belowSubview: self.viewBanco)

        
        /*self.visualEffectBlur.effect = nil
        self.vfx.isHidden = true
        //bancoView.center = self.view.center
        
        //bancoView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        //bancoView.alpha = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            //self.viewBanco.addSubview(self.bancoView)

            //self.vfx.isHidden = false
            self.view.addSubview(self.poupTeste)

        }) { (Bool) in
            //self.effectView.sendSubviewToBack(self.viewBanco)
            self.view.superview?.sendSubviewToBack(self.viewBanco)
            //self.vfx.isHidden = false
            //self.visualEffectBlur.effect = self.effect
            //self.bancoView.alpha = 1
            //self.poupTeste.transform = CGAffineTransform.identity
        }*/
        /*UIView.animate(withDuration: 0.4, animations: {
            
            
            //self.view.addSubview(self.poupTeste)
            //self.poupTeste.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            //self.poupTeste.frame.origin.y -= 150
            self.bancoView.alpha = 0
            

            
            self.visualEffectBlur.effect = nil
            self.vfx.isHidden = true

            
        }) { (Bool) in
            self.poupTeste.frame.origin.y = 150
            self.poup()
            print("OK")
            //self.view.addSubview(self.poupTeste)
            //self.poupTeste.center = self.view.center
            
            //bancoView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            //self.poupTeste.alpha = 0
            //self.bancoView.removeFromSuperview()
            //self.viewBanco.addSubview(self.bancoView)
            //self.vfx.isHidden = true
            /*UIView.animate(withDuration: 1, animations: {
                self.vfx.isHidden = false
                self.visualEffectBlur.effect = self.effect
                self.bancoView.alpha = 1
                self.bancoView.transform = CGAffineTransform.identity
            }, completion: nil)*/
            
        }*/
    }
    
    func poup() {
        
        self.view.addSubview(poupTeste)
        poupTeste.center = self.view.center
        
        //bancoView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        poupTeste.alpha = 0
        
        UIView.animate(withDuration: 1) {
            self.vfx.isHidden = false
            self.visualEffectBlur.effect = self.effect
            self.poupTeste.alpha = 1
            self.poupTeste.transform = CGAffineTransform.identity
        }
        
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionLabel.text = action
        SaldoDisponivel?.text = "Saldo disponível: R$ " + String(format: "%.2f", saldo).replacingOccurrences(of: ".", with: ",")
        ValorTextField?.delegate = self
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
