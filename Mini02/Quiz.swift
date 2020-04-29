//
//  Quiz.swift
//  Mini02
//
//  Created by Gustavo Rigor on 29/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import Foundation
import UIKit

var perguntaAtual = 0
let respostasCertas = 0

struct Resposta {
    var resp = "algum texto"
    var certo = 1 //-1 é errado 1 é certo
}
struct Pergunta {
    var perg = "algum texto"
    var respostaA = Resposta()
    var respostaB = Resposta()
    var respostaC = Resposta()
    var respostaD = Resposta()
    var respostaE = Resposta()
}

let perguntasQuiz = [Pergunta(perg: "Cartão de Crédito é uma despesa fixa ou variável?",respostaA: Resposta(resp: "Variável", certo: 1), respostaB: Resposta(resp: "Fixa", certo: -1),respostaC: Resposta(resp: "Nenhum do dois", certo: -1)),Pergunta(perg: "A faculdade é uma desepasa...",respostaA: Resposta(resp: "Variável", certo: -1), respostaB: Resposta(resp: "Fixa", certo: 1),respostaC: Resposta(resp: "Nenhum do dois", certo: -1)),Pergunta(perg: "Gastos médicos são despesas...",respostaA: Resposta(resp: "Variáveis", certo: 1), respostaB: Resposta(resp: "Fixas", certo: -1),respostaC: Resposta(resp: "Nenhum do dois", certo: -1)),Pergunta(perg: "Quantos é aconcelhável na reserva de emergência?",respostaA: Resposta(resp: "Entre 4 e 8 salários atuais", certo: 1), respostaB: Resposta(resp: "Entre 10 e 12 salários atuais", certo: -1),respostaC: Resposta(resp: "7 salários atuais", certo: -1),respostaD: Resposta(resp: "Entre 3 e 6 salários atuais", certo: -1), respostaE: Resposta(resp: "4 salarios atuais", certo: -1)),Pergunta(perg: "Sobre reserva de emergência, qual é correta?",respostaA: Resposta(resp: "Não é tão importante quando estamos empregados", certo: -1), respostaB: Resposta(resp: "Deve ser o suficiente para no mínimo 3 meses", certo: 1),respostaC: Resposta(resp: "É importante para poder trocar eletrodomésticos", certo: -1),respostaD: Resposta(resp: "Só para empregos instáveis", certo: -1), respostaE: Resposta(resp: "Só quando queremos sair de uma empresa", certo: -1)),Pergunta(perg: "Quais dessas despesas são fixas?",respostaA: Resposta(resp: "Lanches no BK", certo: -1), respostaB: Resposta(resp: "Condomíno", certo: 1),respostaC: Resposta(resp: "Rolê no posto", certo: -1),respostaD: Resposta(resp: "Mensalidade Netflix", certo: 1), respostaE: Resposta(resp: "Sorvete", certo: -1)), Pergunta(perg: "Quais dessas despesas são variáveis?",respostaA: Resposta(resp: "Bute novo", certo: 1), respostaB: Resposta(resp: "Mensalidade da facu", certo: -1),respostaC: Resposta(resp: "Bar do bode", certo: 1),respostaD: Resposta(resp: "Plano de telefone", certo: -1), respostaE: Resposta(resp: "Cineminha com a Kim", certo: 1))]


class Quiz3Resp: UIViewController{
    
    @IBOutlet weak var perguntaQuiz: UILabel!
    @IBOutlet weak var respostaA: UIButton!
    @IBOutlet weak var respostaB: UIButton!
    @IBOutlet weak var respostaC: UIButton!
    @IBOutlet weak var proximaTela: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaPergunta()
        atualizaResposta()
    }
    
    func atualizaPergunta(){
        let pergunta = perguntasQuiz[perguntaAtual]
        perguntaQuiz.text = pergunta.perg
    }
    func atualizaResposta(){
        let pergunta = perguntasQuiz[perguntaAtual]
        respostaA.titleLabel?.text = pergunta.respostaA.resp
        respostaB.titleLabel?.text = pergunta.respostaB.resp
        respostaC.titleLabel?.text = pergunta.respostaC.resp
    }
    @IBAction func verificaRespA(_ sender: UIButton) {
        let pergunta = perguntasQuiz[perguntaAtual]
    }
    @IBAction func verificaRespB(_ sender: Any) {
        let pergunta = perguntasQuiz[perguntaAtual]
    }
    @IBAction func verificaRespC(_ sender: Any) {
        let pergunta = perguntasQuiz[perguntaAtual]
    }
    
    
}

class Quiz5Resp: UIViewController{
    
    @IBOutlet weak var perguntaQuiz: UILabel!
    @IBOutlet weak var respostaA: UIButton!
    @IBOutlet weak var respostaB: UIButton!
    @IBOutlet weak var respostaC: UIButton!
    @IBOutlet weak var respostaD: UIButton!
    @IBOutlet weak var respostaE: UIButton!
    @IBOutlet weak var proximaTela: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func atualizaPergunta(){
        let pergunta = perguntasQuiz[perguntaAtual]
        perguntaQuiz.text = pergunta.perg
    }
    func atualizaResposta(){
        let pergunta = perguntasQuiz[perguntaAtual]
        respostaA.titleLabel?.text = pergunta.respostaA.resp
        respostaB.titleLabel?.text = pergunta.respostaB.resp
        respostaC.titleLabel?.text = pergunta.respostaC.resp
        respostaD.titleLabel?.text = pergunta.respostaD.resp
        respostaE.titleLabel?.text = pergunta.respostaE.resp
    }
    @IBAction func verificaRespA(_ sender: Any) {
    }
    @IBAction func verificaRespB(_ sender: Any) {
    }
    @IBAction func verificaRespC(_ sender: Any) {
    }
    @IBAction func verificaRespD(_ sender: Any) {
    }
    @IBAction func verificaRespE(_ sender: Any) {
    }
    
    
}

class QuizFim: UIViewController{
    
    @IBOutlet weak var kimResultado: UIImageView!
    @IBOutlet weak var resultado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
