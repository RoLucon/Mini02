//
//  ViewController.swift
//  Mini02
//
//  Created by Rogerio Lucon on 27/03/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

var nome = "Kleytinho"
var dindin = 10.00
var fala = "Oi, Eu sou o " + nome
var nSemestre = 5
var semestre = String(nSemestre) + " Semestre"
var situacao = " Pendente "
var investimentoSelecionado = 0 //1-CDB, 2-LCI, 3-CRI, 4-Deb
var aplicada = [10.00,20.00,30.00,40.00]
var imposto0 = [2.00,0.00,1.00,2.00]
var bruto0 = [15.00,23.00,35.00,30.00]

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
     
    let personagem: Personagem = Personagem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaSaldo()
        atualizaFala()
        atualizaNome()
        atualizaSemestre()
        atualizaSituacao()
        // Do any additional setup after loading the view.
    }
    //Funcao para atualizar o saldo ao iniciar a tela
    func atualizaSaldo(){
        Dinheiro.text = "R$"+String(dindin)+"0 "
    }
    //Funcao para atualizar a fala da personagem ao carregar a tela
    func atualizaFala(){
        FalaPrsonagem.text=fala
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
    
    @IBOutlet weak var explicacao: UILabel!
   
    @IBOutlet weak var tipoInvestimento: UILabel!
    @IBOutlet weak var aplicado: UILabel!
    
    @IBOutlet weak var bruto: UILabel!
    
    @IBOutlet weak var imposto: UILabel!
    
    @IBOutlet weak var lucro: UILabel!
    
    @IBOutlet weak var trianguloConstraints: NSLayoutConstraint!
    
    var Explicacao = ["CDB - O Certificado de Depósito Bancário é um tipo de investimento em renda fixa oferecidos por bancos e com a proteção do Fundo Garantidor de Créditos. Este investimento é de baixo risco e sem taxas de administração, mas com a necessidade de ser declarado no imposto de renda. O CDB é, na prática, um empréstimo de dinheiro ao banco, e este te paga com juros. E este juros, o lucro do investimento, é acordado com a instituição financeira quando o CDB é adquirido. (Colocar a regra do jogo, pelo que é apresentado nas pesquisa que fiz, no ano passado o lucro médio de um bom CDB estava em torno 15 a 20% dependendo do tempo do investimento. Eu gostaria de deixar mais ou menos entre 1 e 1,5% ao mês). Sendo que o Imposto de renda é de 15% (na vida real este valor varia com o tempo em que a pessoa fica com o CDB Variando de 22,5 a 15%) em cima do lucro que você tiver neste investimento.","LCI/LCA - Letras de Crédito Imobiliário e Letras de Crédito do Agronegócio é um tipo de investimento em renda fixa oferecidos por bancos e com a proteção do Fundo Garantidor de Créditos. Este investimento é de baixo risco e sem taxas. Os LCI e LCA são na prática, um empréstimo destinado ao setor do agronegócio e do setor imobiliário. O lucro do investimento é acordado com a instituição financeira quando é adquirido. (Colocar a regra do jogo, pelo que é apresentado nas pesquisa que fiz, no ano passado o lucro médio de um bom LCI/LCA estava em torno 5 a 10% dependendo do tempo do investimento. Eu gostaria de deixar mais ou menos entre 0,5 e 1% ao mês). Não há impostos neste tipo de investimento, ou seja, o valor líquido é o mesmo que o valor bruto.","CRI/CRA - Certificado de Recebíveis Imobiliários e Certificado de Recebíveis do Agronegócio é um tipo de investimento em renda fixa oferecidos por securitizadoras. Os CRI e CRA são, na prática, um empréstimo destinado ao agronegócio ao setor imobiliário para que estes setores tenham capital, por exemplo, para realizar o financiamento de um imóvel. O lucro do investimento é acordado com a corretora quando é adquirido. Este investimento  não é protegido pelo Fundo Garantidor de Créditos o que pode significar perdas financeiras caso os devedores não cumpram sua parte no acordo. (Colocar a regra do jogo, pelo que é apresentado nas pesquisa que fiz, não achei um valor certo do valor do lucro, aparentemente porque depende do tempo que está investindo e da confiabilidade que a securitizadora tem, pois pode haver um calote. Os dados que eu encontrei são baseados no CDI, que é um valor que flutua. Eu gostaria de deixar mais ou menos entre 1,5 e 2% ao mês). Não há impostos neste tipo de investimento, mas pode haver uma cobrança de uma taxa administrativa da corretora (Os valores estão na casa de 2% do valor investido).","Debêntures - Debêntures é um tipo de investimento em renda fixa oferecidos por corretoras. As debêntures são, na prática, um empréstimo para empresas que estão arrecadando recursos para financiar o desenvolvimento de seu negócio. O lucro do investimento é acordado com a corretora quando é adquirido. Este investimento  não é protegido pelo Fundo Garantidor de Créditos o que pode significar perdas financeiras caso os devedores não cumpram sua parte no acordo. (Colocar a regra do jogo, pelo que é apresentado nas pesquisa que fiz, no ano passado o lucro médio de um bom Debênture estava em torno 10 a 20% dependendo do tempo do investimento. Eu gostaria de deixar mais ou menos 1,5 % ao mês). Sendo que o Imposto de renda é de 15% (na vida real este valor varia com o tempo em que a pessoa fica com o CDB Variando de 22,5 a 15%) em cima do lucro que você tiver neste investimento."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaRendimento()
        atualizaMsg()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func bCDB(_ sender: UIButton) {
        investimentoSelecionado = 0
        atualizaMsg()
        tipoInvestimento.text = "CDB"
        trianguloConstraints.constant = 319
        atualizaRendimento()
        
    }
    @IBAction func bLCI(_ sender: Any) {
        investimentoSelecionado = 1
        atualizaMsg()
        tipoInvestimento.text = "LCI/LCA"
        trianguloConstraints.constant = 243
        atualizaRendimento()
    }
    @IBAction func bCRI(_ sender: Any) {
        investimentoSelecionado = 2
        atualizaMsg()
        tipoInvestimento.text = "CRI/CRA"
        trianguloConstraints.constant = 151
        atualizaRendimento()
    }
    @IBAction func bDEB(_ sender: Any) {
        investimentoSelecionado = 3
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
        aplicado.text = "R$ " + String( aplicada[investimentoSelecionado]) + "0"
        bruto.text = "R$ " + String( bruto0[investimentoSelecionado]) + "0"
        imposto.text = "R$ " + String( imposto0[investimentoSelecionado]) + "0"
        lucro.text = "R$ " + String(( bruto0[investimentoSelecionado] - imposto0[investimentoSelecionado])-aplicada[investimentoSelecionado]) + "0"
    }
    func atualizaMsg(){
        explicacao.text = Explicacao[investimentoSelecionado]
    }
    
    
}
class Investe: UIViewController{
    
    
    @IBOutlet weak var saldoDisp: UILabel!
    
    @IBOutlet weak var vlrInvestido: UITextField!
    
    @IBOutlet weak var saldoIndisponivel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaSaldoDispo()
        
        // Do any additional setup after loading the view.
    }
    func atualizaSaldoDispo(){
        saldoDisp.text = "Saldo disponível: R$ " + String(dindin) + "0 "
    }
    @IBAction func confirmaInvestimento(_ sender: UIButton) {
        let investido : String = vlrInvestido.text!
        
        if (dindin < Double(investido)!) {
            saldoIndisponivel.textColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.9)
        }
        else{
            aplicada[investimentoSelecionado] = aplicada[investimentoSelecionado] + Double(investido)!
            bruto0[investimentoSelecionado] = bruto0[investimentoSelecionado] + Double(investido)!
            dindin = dindin - Double(investido)!
        }
        atualizaSaldoDispo()
    }
    
}


