//
//  InvestirViewController.swift
//  Mini02
//
//  Created by Gustavo Rigor on 22/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

extension Investe : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

class Investe: UIViewController{
    var valorGuardado:Int = 0
    var contador:Int = 0
    let investimento: Investimento = Investimento()
    
    let personagem: Personagem = Personagem.shared
    
    @IBOutlet weak var saldoDisp: UILabel!
    
    @IBOutlet weak var vlrInvestido: UITextField!
    
    @IBOutlet weak var saldoIndisponivel: UILabel!
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaSaldoDispo()
        observer()
        vlrInvestido?.delegate = self
        
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
        let temp:Float? = personagem.mexerDinheiro(valor: nil)
        saldoDisp.text = String(format: "Saldo disponível: R$ %.2f", temp!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        vlrInvestido?.resignFirstResponder()
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    @IBAction func valorAlterado(_ sender: Any) {
        let last = (vlrInvestido.text?.last)!
        if vlrInvestido.text!.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil {
            let count:Int = vlrInvestido.text?.count as! Int
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
        vlrInvestido.text = String(aux)
        contador = vlrInvestido.text?.count as! Int
    }
    
    @IBAction func confirmaInvestimento(_ sender: UIButton) {
        if(vlrInvestido.hasText){
            let investido1 : String! = vlrInvestido.text?.replacingOccurrences(of: ",", with: ".")
            let investido = (investido1 as NSString).floatValue
            let temp:Float? = personagem.mexerDinheiro(valor: nil)
        
            if (temp! < investido){
                saldoIndisponivel.isHidden = false
            }
            else{
                investimento.setAplicada(investimento.getAplicada() + Double(investido))
                investimento.setBruto(investimento.getBruto() + Double(investido))
                _ = personagem.mexerDinheiro(valor: -1 * investido)
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
