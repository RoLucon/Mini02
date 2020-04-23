//
//  InvestimentoViewController.swift
//  Mini02
//
//  Created by Gustavo Rigor on 22/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import Foundation
import UIKit

let CDBEx = """
CDB - O Certificado de Depósito Bancário é um tipo de investimento em renda fixa oferecidos por bancos e com a proteção do Fundo Garantidor de Créditos. Este investimento é de baixo risco e sem taxas de administração, mas com a necessidade de ser declarado no imposto de renda. O CDB é, na prática, um empréstimo de dinheiro ao banco, e este te paga com juros. E este juros, o lucro do investimento, é acordado com a instituição financeira quando o CDB é adquirido.
    (Colocar a regra do jogo, pelo que é apresentado nas pesquisa que fiz, no ano passado o lucro médio de um bom CDB estava em torno 15 a 20% dependendo do tempo do investimento. Eu gostaria de deixar mais ou menos entre 1 e 1,5% ao mês).
    Sendo que o Imposto de renda é de 15% (na vida real este valor varia com o tempo em que a pessoa fica com o CDB Variando de 22,5 a 15%) em cima do lucro que você tiver neste investimento.
"""
let LCIEx = """
LCI/LCA - Letras de Crédito Imobiliário e Letras de Crédito do Agronegócio é um tipo de investimento em renda fixa oferecidos por bancos e com a proteção do Fundo Garantidor de Créditos. Este investimento é de baixo risco e sem taxas. Os LCI e LCA são na prática, um empréstimo destinado ao setor do agronegócio e do setor imobiliário. O lucro do investimento é acordado com a instituição financeira quando é adquirido.
    (Colocar a regra do jogo, pelo que é apresentado nas pesquisa que fiz, no ano passado o lucro médio de um bom LCI/LCA estava em torno 5 a 10% dependendo do tempo do investimento. Eu gostaria de deixar mais ou menos entre 0,5 e 1% ao mês).
    Não há impostos neste tipo de investimento, ou seja, o valor líquido é o mesmo que o valor bruto.
"""
let CRIEx = """
CRI/CRA - Certificado de Recebíveis Imobiliários e Certificado de Recebíveis do Agronegócio é um tipo de investimento em renda fixa oferecidos por securitizadoras. Os CRI e CRA são, na prática, um empréstimo destinado ao agronegócio ao setor imobiliário para que estes setores tenham capital, por exemplo, para realizar o financiamento de um imóvel. O lucro do investimento é acordado com a corretora quando é adquirido. Este investimento  não é protegido pelo Fundo Garantidor de Créditos o que pode significar perdas financeiras caso os devedores não cumpram sua parte no acordo.
    (Colocar a regra do jogo, pelo que é apresentado nas pesquisa que fiz, não achei um valor certo do valor do lucro, aparentemente porque depende do tempo que está investindo e da confiabilidade que a securitizadora tem, pois pode haver um calote. Os dados que eu encontrei são baseados no CDI, que é um valor que flutua. Eu gostaria de deixar mais ou menos entre 1,5 e 2% ao mês).
    Não há impostos neste tipo de investimento, mas pode haver uma cobrança de uma taxa administrativa da corretora (Os valores estão na casa de 2% do valor investido).
"""
let DEBEx = """
Debêntures - Debêntures é um tipo de investimento em renda fixa oferecidos por corretoras. As debêntures são, na prática, um empréstimo para empresas que estão arrecadando recursos para financiar o desenvolvimento de seu negócio. O lucro do investimento é acordado com a corretora quando é adquirido. Este investimento  não é protegido pelo Fundo Garantidor de Créditos o que pode significar perdas financeiras caso os devedores não cumpram sua parte no acordo.
    (Colocar a regra do jogo, pelo que é apresentado nas pesquisa que fiz, no ano passado o lucro médio de um bom Debênture estava em torno 10 a 20% dependendo do tempo do investimento. Eu gostaria de deixar mais ou menos 1,5 % ao mês).
    Sendo que o Imposto de renda é de 15% (na vida real este valor varia com o tempo em que a pessoa fica com o CDB Variando de 22,5 a 15%) em cima do lucro que você tiver neste investimento.
"""

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