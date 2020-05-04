//
//  InvestimentoViewController.swift
//  Mini02
//
//  Created by Gustavo Rigor on 22/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import Foundation
import UIKit

class Investimentos: UIViewController {
    
    var investimento: Investimento = Investimento()
    
    let notificacao = Notification.Name(rawValue: atualizaRendimentosNotificationKey)
    
    //@IBOutlet weak var explicacao: UILabel!
    @IBOutlet weak var explicacao: UITextView!
    
    @IBOutlet weak var tipoInvestimento: UILabel!
    @IBOutlet weak var aplicado: UILabel!
    
    @IBOutlet weak var bruto: UILabel!
    
    @IBOutlet weak var imposto: UILabel!
    
    @IBOutlet weak var lucro: UILabel!
    
    @IBOutlet weak var trianguloConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var efeitoConstraints: NSLayoutConstraint!
    
    @IBOutlet var telaAjuda: UIView!
    
    @IBOutlet weak var efeito: UIVisualEffectView!
    
    @IBOutlet weak var textoAjuda: UILabel!
    
    @IBOutlet weak var voltarNavBtt: UIButton!
    @IBOutlet weak var viewFase: UIView!
    @IBOutlet weak var seuRendimento: UILabel!
    @IBOutlet weak var bttSacar: UIButton!
    @IBOutlet weak var viewAjudaInvest: UIView!
    @IBOutlet weak var viewRendimento: UIView!
    @IBOutlet weak var viewKim: UIView!
    @IBOutlet weak var kimHeigth: NSLayoutConstraint!
    @IBOutlet weak var proximoBtt: UIButton!
    @IBOutlet weak var anteriorBtt: UIButton!
    @IBOutlet weak var primeiraAlternativaBtt: UIButton!
    @IBOutlet weak var segundaAlternativaBtt: UIButton!
    
    @IBOutlet weak var tiposInvestStack: UIStackView!
    @IBOutlet weak var textoKim: UILabel!
    @IBOutlet weak var flecha: UIImageView!
    
    var investFase = true
    var indexKim = ["index": 10, "primeira": 1]
    
    let TextAjuda = "Está é a tela de investimentos. Aqui vai ser possível aplicar o seu dinheiro e ver ele rendendo com o passar do tempo. Todos os investimentos são rendas fixas, isso significa que você receberá juros por ter esta aplicação. Cada um dos investimenros terá uma explicção mais detalhada, basta clicar sobre algum deles. O investimento será de grande ajuda no decorrer da história, além de uma ótima maneira de guardar o seu dinheiro na vida real e receber por isso."
    

    var Explicacao = [CDBEx,LCIEx,CRIEx,DEBEx]
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    var effeito:UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textoAjuda.text = TextAjuda
        effeito = efeito.effect
        efeito.effect = nil
        telaAjuda.layer.cornerRadius = 5
        investimento.investimentoSelecionado = 0
        atualizaRendimento()
        atualizaMsg()
        observer()
        if investFase {
            viewFase.isHidden = false
            viewRendimento.bottomAnchor.constraint(equalTo: viewKim.topAnchor, constant: -10).isActive = true
            textoKim.text = perguntaFase4[indexKim["index"]!]
        }
    }
    
    func observer(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.atualizaRendimentoVlr(notificacao:)), name: notificacao, object: nil)
    }
    @objc func atualizaRendimentoVlr(notificacao: NSNotification){
        print("a notificacao chegou")
        atualizaRendimento()
    }
    
    @IBAction func bCDB(_ sender: UIButton) {
        investimento.investimentoSelecionado = 0
        atualizaMsg()
        tipoInvestimento.text = "CDB"
        trianguloConstraints.constant = 319
        atualizaRendimento()
        
    }
    @IBAction func bLCI(_ sender: Any) {
        investimento.investimentoSelecionado = 1
        atualizaMsg()
        tipoInvestimento.text = "LCI/LCA"
        trianguloConstraints.constant = 243
        atualizaRendimento()
    }
    @IBAction func bCRI(_ sender: Any) {
        investimento.investimentoSelecionado = 2
        atualizaMsg()
        tipoInvestimento.text = "CRI/CRA"
        trianguloConstraints.constant = 151
        atualizaRendimento()
    }
    @IBAction func bDEB(_ sender: Any) {
        investimento.investimentoSelecionado = 3
        atualizaMsg()
        tipoInvestimento.text = "DEBÊNTURES"
        trianguloConstraints.constant = 37
        atualizaRendimento()
    }
    
    
    @IBAction func backBtt(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func atualizaRendimento(){
        investimento = Investimento()
        bruto.text = String(format:"R$ %.2f ",investimento.getBruto())
        imposto.text = String(format:"R$ %.2f",investimento.getImposto())
        investimento.setLucro(investimento.getBruto() - investimento.getImposto()-investimento.getAplicada())
        investimento.setLiquido( investimento.getBruto()-investimento.getImposto() )
        aplicado.text = String(format: "R$ %.2f", investimento.getLiquido())
        lucro.text = String(format: "R$ %.2f",investimento.getLucro())
    }
    
    func atualizaMsg(){
        explicacao.text = Explicacao[investimento.investimentoSelecionado]
    }
    func adicionaEfeito(){
        efeitoConstraints.constant = 0
        self.view.addSubview(telaAjuda)
        telaAjuda.center = self.view.center
        telaAjuda.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        telaAjuda.alpha = 0
        UIView.animate(withDuration: 0.4){
            self.efeito.effect = self.effeito
            self.telaAjuda.alpha = 1
            self.telaAjuda.transform = CGAffineTransform.identity
        }
    }
    func retiraEfeito(){
        efeitoConstraints.constant = -414
        UIView.animate(withDuration: 0.3, animations:{
            self.telaAjuda.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.telaAjuda.alpha = 0
            self.efeito.effect = nil
        }) { (success: Bool) in
            self.telaAjuda.removeFromSuperview()
        }
    }
    
    @IBAction func ajudaInvestimento(_ sender: UIButton) {
        adicionaEfeito()
    }
    @IBAction func ajudaFechar(_ sender: UIButton) {
        retiraEfeito()
    }
    
    //Botoes tela da Kim --- Func Para fase 4
    @IBAction func proximaFala(_ sender: Any) {
        indexKim["index"]! += 1
        print(indexKim["index"]!)
        if let texto = perguntaFase4[indexKim["index"]!] {
            textoKim.text = texto
        }
        if let alter = alternativasFase4[indexKim["index"]!] {
            ajustaTelaParaAlternativas(250)
            primeiraAlternativaBtt.isHidden = false
            segundaAlternativaBtt.tag = 0
            primeiraAlternativaBtt.setTitle(alter[0], for: .normal)
            primeiraAlternativaBtt.addTarget(self, action: #selector(feedBackAternativas), for: .touchUpInside)
            segundaAlternativaBtt.isHidden = false
            segundaAlternativaBtt.tag = 1
            segundaAlternativaBtt.setTitle(alter[1], for: .normal)
            segundaAlternativaBtt.addTarget(self, action: #selector(feedBackAternativas), for: .touchUpInside)
            proximoBtt.isEnabled = false
            anteriorBtt.isEnabled = false
            indexKim["primeira"] = indexKim["index"]! + 1
        }
        verificaFalas()
    }

    @IBAction func voltarFala(_ sender: Any) {
        print(indexKim["index"]!)
        if indexKim["index"]! > indexKim["primeira"]! {
            indexKim["index"]! -= 1
            textoKim.text = perguntaFase4[indexKim["index"]!]
        }
        verificaFalas()
    }
    
    func verificaFalas(){
        if indexKim["index"]! >= 12 && indexKim["index"]! <= 18 {
            self.view.bringSubviewToFront(viewAjudaInvest)
            self.view.bringSubviewToFront(tiposInvestStack)
            bCDB(UIButton())
             print("CDB")
        } else if indexKim["index"]! >= 19 && indexKim["index"]! <= 25 {
            bLCI(self)
             print("LCI")
        } else if indexKim["index"]! >= 26 && indexKim["index"]! <= 30 {
            bCRI(self)
             print("CRI")
        } else if indexKim["index"]! >= 31 && indexKim["index"]! <= 33 {
            self.view.bringSubviewToFront(viewAjudaInvest)
            self.view.bringSubviewToFront(tiposInvestStack)
            bDEB(self)
             print("Debenture")
        } else {
            self.view.bringSubviewToFront(viewFase)
        }
        if indexKim["index"]! == 37 {
            proximoBtt.isEnabled = false
            anteriorBtt.isEnabled = false
            flecha.isHidden = false
            self.view.bringSubviewToFront(voltarNavBtt)
        }
    }
    
    func ajustaTelaParaAlternativas(_ height: CGFloat) {
        
        UIView.animate(withDuration: 0, delay: 0, animations: {
        }, completion: {_ in
            let h: CGFloat = self.kimHeigth.constant
            if h < height {
                self.kimHeigth.constant += 10
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                    self.ajustaTelaParaAlternativas(height)
                }
            } else if h > height {
                self.kimHeigth.constant -= 10
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                    self.ajustaTelaParaAlternativas(height)
                }
            }
            
        })
    }
    
    @objc func feedBackAternativas(_ sender: UIButton){
        print(sender.tag)
        if let aux = feedBakcFase4[indexKim["index"]!] {
            textoKim.text = aux[sender.tag]
        }
        primeiraAlternativaBtt.isHidden = true
        segundaAlternativaBtt.isHidden = true
        proximoBtt.isEnabled = true
        anteriorBtt.isEnabled = true
        ajustaTelaParaAlternativas(140)
    }
}
