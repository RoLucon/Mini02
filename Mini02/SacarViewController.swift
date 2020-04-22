//
//  SacarViewController.swift
//  Mini02
//
//  Created by Gustavo Rigor on 22/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit


extension Saque : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

class Saque: UIViewController{
    var valorGuardado:Int = 0
    var contador:Int = 0
    
    @IBOutlet weak var SaldoIndisp: UILabel!
    @IBOutlet weak var SaldoSaque: UILabel!
    @IBOutlet weak var VlrSaque: UITextField!
    
    let investimento: Investimento = Investimento()
    
    let personagem: Personagem = Personagem()
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaSaldoDispo()
        observer()
        VlrSaque?.delegate = self
        // Do any additional setup after loading the view.
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
    
    func atualizaSaldoDispo(){
        SaldoSaque.text = String(format:"Saldo disponível: R$ %.2f",investimento.getBruto() - investimento.getImposto())
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        VlrSaque?.resignFirstResponder()
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    @IBAction func valorAlterado(_ sender: Any) {
        let last = (VlrSaque.text?.last)!
        if VlrSaque.text!.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil {
            let count:Int = VlrSaque.text?.count as! Int
            if  count > contador {
            if let valor = Double(String(last)) {
                valorGuardado = valorGuardado * 10 + Int(valor)
            }
            } else {
                if valorGuardado % 10 > 0 {
                    let mod:Int = valorGuardado % 10
                    valorGuardado = (valorGuardado - mod) / 10
                } else {
                    valorGuardado = valorGuardado / 10
                }
            }
        }
        let aux: Double = Double(valorGuardado) / 100
        VlrSaque.text = String(aux)
        contador = VlrSaque.text?.count as! Int
    }
    
    @IBAction func ConfirmaSaque(_ sender: UIButton) {
        if(VlrSaque.hasText){
            let Saque1 : String! = VlrSaque.text?.replacingOccurrences(of: ",", with: ".")
            let Saque = (Saque1 as NSString).floatValue
            let disp = investimento.getBruto() - investimento.getImposto()
            if (disp < Double(Saque)) {
                SaldoIndisp.textColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.9)
            }
            else{
                let percent = 1 - Double(Saque)/(disp)
                investimento.setBruto(investimento.getBruto() * percent)
                investimento.setImposto(investimento.getImposto() * percent)
                investimento.setAplicada(investimento.getAplicada() * percent)
                investimento.setLucro(investimento.getLucro() * percent)
    
                _=personagem.mexerDinheiro(valor: Saque)
                let nome = Notification.Name(rawValue: atualizaRendimentosNotificationKey)
                NotificationCenter.default.post(name: nome, object: nil)
                self.dismiss(animated: true, completion: nil)
            }
            atualizaSaldoDispo()
        }
        else{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

