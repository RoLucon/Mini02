//
//  ViewController.swift
//  Mini02
//
//  Created by Rogerio Lucon on 27/03/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

var situacao = " Pendente "

let atualizaRendimentosNotificationKey = "co.gusrigor.atualizaRendimento"
let atualizaFalaNotificationKey = "co.gusrigor.atualizaFala"
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

class ViewController: UIViewController {
    
    //Fala da personagem no campo da tela de intro
    @IBOutlet weak var FalaPrsonagem: UITextView!
    //A quantidade de dinheiro da personagem no jogo
    @IBOutlet weak var Dinheiro: UILabel!
    //O nome da personagem
    @IBOutlet weak var NomePersonagem: UILabel!
    //Semestre o qual a personagem esta
    @IBOutlet weak var Semestre: UILabel!
    //A situacao financeira da personagem
    @IBOutlet weak var Situacao: UILabel!
    let notificacao = Notification.Name(rawValue: atualizaFalaNotificationKey)
     
    var personagem: Personagem = Personagem()
    
    deinit {
           NotificationCenter.default.removeObserver(self)
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaSaldo()
        atualizaFala()
        atualizaNome()
        atualizaSemestre()
        atualizaSituacao()
        observer()
        // Do any additional setup after loading the view.
    }
  

    @IBAction func configuracao(_ sender: Any) {
        let confgView = ConfigView(frame: view.frame, viewController: self)
        view.addSubview(confgView)
        confgView.translatesAutoresizingMaskIntoConstraints = false
        confgView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        confgView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        confgView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        confgView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
  
    func observer(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.atualizarFala(notificacao:)), name: notificacao, object: nil)
    }
  
    @objc func atualizarFala(notificacao: NSNotification){
        print("a notificacao chegou")
        atualizaSaldo()
        atualizaFala()
    }
    //Funcao para atualizar o saldo ao iniciar a tela
    func atualizaSaldo(){
        print("FOI")
        personagem = Personagem()
        let temp:Float? = personagem.mexerDinheiro(valor: nil)
        Dinheiro.text = String(format:"R$ %.2f",temp!)
    }
    //Funcao para atualizar a fala da personagem ao carregar a tela
    func atualizaFala(){
        personagem = Personagem()
        let temp:Int? = personagem.mexerScore(valor: nil)
        if(temp!>650){
            FalaPrsonagem.text = "Está na situação boa!"
        }else if(temp!>350){
            FalaPrsonagem.text = "Está na situação Mais ou menos!"
        }else{
            FalaPrsonagem.text = "Está na situação Ruim!"
        }
    }
    func atualizaNome(){
        NomePersonagem.text = personagem.nome
    }
    func atualizaSemestre(){
        Semestre.text = "\(personagem.semestreAtual()) Semestre"
    }
    func atualizaSituacao(){
        Situacao.text = situacao
    }
}
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
    
    @IBAction func atualizaRendimentoButton(_ sender: UIButton) {
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
    
    let personagem: Personagem = Personagem()
    
    @IBOutlet weak var saldoDisp: UILabel!
    
    @IBOutlet weak var vlrInvestido: UITextField!
    
    @IBOutlet weak var saldoIndisponivel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaSaldoDispo()
        vlrInvestido?.delegate = self
        
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
                saldoIndisponivel.textColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.9)
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

extension saque : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

class saque: UIViewController{
    var valorGuardado:Int = 0
    var contador:Int = 0
    
    @IBOutlet weak var SaldoIndisp: UILabel!
    @IBOutlet weak var SaldoSaque: UILabel!
    @IBOutlet weak var VlrSaque: UITextField!
    
    let investimento: Investimento = Investimento()
    
    let personagem: Personagem = Personagem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaSaldoDispo()
        VlrSaque?.delegate = self
        // Do any additional setup after loading the view.
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


