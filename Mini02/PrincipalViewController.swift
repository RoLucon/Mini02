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
        // Do any additional setup after loading the view.
    }
    func observer(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.atualizarFala(notificacao:)), name: notificacao, object: nil)
    }
    @objc func atualizarFala(notificacao: NSNotification){
        atualizaSaldo()
        atualizaFala()
    }
    //Funcao para atualizar o saldo ao iniciar a tela
    func atualizaSaldo(){
        personagem = Personagem()
        let temp:Float? = personagem.mexerDinheiro(valor: nil)
        //_ = personagem.mexerDinheiro(valor: 60.0)
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
    
    @IBOutlet weak var explicacao: UILabel!
   
    @IBOutlet weak var tipoInvestimento: UILabel!
    @IBOutlet weak var aplicado: UILabel!
    
    @IBOutlet weak var bruto: UILabel!
    
    @IBOutlet weak var imposto: UILabel!
    
    @IBOutlet weak var lucro: UILabel!
    
    @IBOutlet weak var trianguloConstraints: NSLayoutConstraint!
    
    var Explicacao = ["CDB - O Certificado de Depósito Bancário é um tipo de investimento em renda fixa oferecidos por bancos e com a proteção do Fundo Garantidor de Créditos. Este investimento é de baixo risco e sem taxas de administração, mas com a necessidade de ser declarado no imposto de renda. O CDB é, na prática, um empréstimo de dinheiro ao banco, e este te paga com juros. E este juros, o lucro do investimento, é acordado com a instituição financeira quando o CDB é adquirido. (Colocar a regra do jogo, pelo que é apresentado nas pesquisa que fiz, no ano passado o lucro médio de um bom CDB estava em torno 15 a 20% dependendo do tempo do investimento. Eu gostaria de deixar mais ou menos entre 1 e 1,5% ao mês). Sendo que o Imposto de renda é de 15% (na vida real este valor varia com o tempo em que a pessoa fica com o CDB Variando de 22,5 a 15%) em cima do lucro que você tiver neste investimento.","LCI/LCA - Letras de Crédito Imobiliário e Letras de Crédito do Agronegócio é um tipo de investimento em renda fixa oferecidos por bancos e com a proteção do Fundo Garantidor de Créditos. Este investimento é de baixo risco e sem taxas. Os LCI e LCA são na prática, um empréstimo destinado ao setor do agronegócio e do setor imobiliário. O lucro do investimento é acordado com a instituição financeira quando é adquirido. (Colocar a regra do jogo, pelo que é apresentado nas pesquisa que fiz, no ano passado o lucro médio de um bom LCI/LCA estava em torno 5 a 10% dependendo do tempo do investimento. Eu gostaria de deixar mais ou menos entre 0,5 e 1% ao mês). Não há impostos neste tipo de investimento, ou seja, o valor líquido é o mesmo que o valor bruto.","CRI/CRA - Certificado de Recebíveis Imobiliários e Certificado de Recebíveis do Agronegócio é um tipo de investimento em renda fixa oferecidos por securitizadoras. Os CRI e CRA são, na prática, um empréstimo destinado ao agronegócio ao setor imobiliário para que estes setores tenham capital, por exemplo, para realizar o financiamento de um imóvel. O lucro do investimento é acordado com a corretora quando é adquirido. Este investimento  não é protegido pelo Fundo Garantidor de Créditos o que pode significar perdas financeiras caso os devedores não cumpram sua parte no acordo. (Colocar a regra do jogo, pelo que é apresentado nas pesquisa que fiz, não achei um valor certo do valor do lucro, aparentemente porque depende do tempo que está investindo e da confiabilidade que a securitizadora tem, pois pode haver um calote. Os dados que eu encontrei são baseados no CDI, que é um valor que flutua. Eu gostaria de deixar mais ou menos entre 1,5 e 2% ao mês). Não há impostos neste tipo de investimento, mas pode haver uma cobrança de uma taxa administrativa da corretora (Os valores estão na casa de 2% do valor investido).","Debêntures - Debêntures é um tipo de investimento em renda fixa oferecidos por corretoras. As debêntures são, na prática, um empréstimo para empresas que estão arrecadando recursos para financiar o desenvolvimento de seu negócio. O lucro do investimento é acordado com a corretora quando é adquirido. Este investimento  não é protegido pelo Fundo Garantidor de Créditos o que pode significar perdas financeiras caso os devedores não cumpram sua parte no acordo. (Colocar a regra do jogo, pelo que é apresentado nas pesquisa que fiz, no ano passado o lucro médio de um bom Debênture estava em torno 10 a 20% dependendo do tempo do investimento. Eu gostaria de deixar mais ou menos 1,5 % ao mês). Sendo que o Imposto de renda é de 15% (na vida real este valor varia com o tempo em que a pessoa fica com o CDB Variando de 22,5 a 15%) em cima do lucro que você tiver neste investimento."]
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
}

class Investe: UIViewController{
    
    let investimento: Investimento = Investimento()
    
    let personagem: Personagem = Personagem()
    
    @IBOutlet weak var saldoDisp: UILabel!
    
    @IBOutlet weak var vlrInvestido: UITextField!
    
    @IBOutlet weak var saldoIndisponivel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaSaldoDispo()
        
        // Do any additional setup after loading the view.
    }
    func atualizaSaldoDispo(){
        let temp:Float? = personagem.mexerDinheiro(valor: nil)
        saldoDisp.text = String(format: "Saldo disponível: R$ %.2f", temp!)
    }
    @IBAction func confirmaInvestimento(_ sender: UIButton) {
        let investido : String = vlrInvestido.text!
        let temp:Float? = personagem.mexerDinheiro(valor: nil)
        
        if (temp! < Float(investido)!) {
            saldoIndisponivel.textColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.9)
        }
        else{
            investimento.setAplicada(investimento.getAplicada() + Double(investido)!)
            investimento.setBruto(investimento.getBruto() + Double(investido)!)
            _ = personagem.mexerDinheiro(valor: -1 * Float(investido)!)
            let nome = Notification.Name(rawValue: atualizaRendimentosNotificationKey)
            NotificationCenter.default.post(name: nome, object: nil)
            self.dismiss(animated: true, completion: nil)
        }
        atualizaSaldoDispo()
    }
    
}

class saque: UIViewController{
    
    @IBOutlet weak var SaldoIndisp: UILabel!
    @IBOutlet weak var SaldoSaque: UILabel!
    @IBOutlet weak var VlrSaque: UITextField!
    
    let investimento: Investimento = Investimento()
    
    let personagem: Personagem = Personagem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaSaldoDispo()
        // Do any additional setup after loading the view.
    }
    func atualizaSaldoDispo(){
        SaldoSaque.text = String(format:"Saldo disponível: R$ %.2f",investimento.getBruto() - investimento.getImposto())
    }
    @IBAction func ConfirmaSaque(_ sender: UIButton) {
        let Saque : String = VlrSaque.text!
        let disp = investimento.getBruto() - investimento.getImposto()
        if (disp < Double(Saque)!) {
            SaldoIndisp.textColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.9)
        }
        else{
            let percent = 1 - Double(Saque)!/(disp)
            investimento.setBruto(investimento.getBruto() * percent)
            investimento.setImposto(investimento.getImposto() * percent)
            investimento.setAplicada(investimento.getAplicada() * percent)
            investimento.setLucro(investimento.getLucro() * percent)
    
            _=personagem.mexerDinheiro(valor: Float(Saque)!)
            let nome = Notification.Name(rawValue: atualizaRendimentosNotificationKey)
            NotificationCenter.default.post(name: nome, object: nil)
        }
        atualizaSaldoDispo()
        self.dismiss(animated: true, completion: nil)
    }
    
}


