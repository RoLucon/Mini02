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
        
        // Do any additional setup after loading the view.
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
    
}
