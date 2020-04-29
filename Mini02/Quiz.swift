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
var respostasCertas = 0

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
        respostaA.setTitle(pergunta.respostaA.resp, for: .normal)
        respostaA.setTitleColor(UIColor.systemTeal, for: .normal)
        respostaA.backgroundColor = UIColor.white
        respostaB.setTitle(pergunta.respostaB.resp, for: .normal)
        respostaB.setTitleColor(UIColor.systemTeal, for: .normal)
        respostaB.backgroundColor = UIColor.white
        respostaC.setTitle(pergunta.respostaC.resp, for: .normal)
        respostaC.setTitleColor(UIColor.systemTeal, for: .normal)
        respostaC.backgroundColor = UIColor.white
    }
    @IBAction func verificaRespA(_ sender: UIButton) {
        let pergunta = perguntasQuiz[perguntaAtual]
        let certo = pergunta.respostaA.certo
        respostasCertas += certo
        if certo == 1 {
            respostaA.setTitleColor(UIColor.white, for: .normal)
            respostaA.backgroundColor = UIColor.green
            perguntaAtual += 1
            if perguntaAtual == 3{
                proximaTela.isHidden = false
            }else{
                UIView.animate(withDuration: 1.2){
                    self.atualizaPergunta()
                    self.atualizaResposta()
                }
            }
        }else{
            respostaA.setTitleColor(UIColor.white, for: .normal)
            respostaA.backgroundColor = UIColor.red
        }
    }
    @IBAction func verificaRespB(_ sender: Any) {
        let pergunta = perguntasQuiz[perguntaAtual]
        let certo = pergunta.respostaB.certo
        respostasCertas += certo
        if certo == 1 {
            respostaB.setTitleColor(UIColor.white, for: .normal)
            respostaB.backgroundColor = UIColor.green
            perguntaAtual += 1
            if perguntaAtual == 3{
                proximaTela.isHidden = false
            }else{
                UIView.animate(withDuration: 1.2){
                    self.atualizaPergunta()
                    self.atualizaResposta()
                }
            }
        }else{
            respostaB.setTitleColor(UIColor.white, for: .normal)
            respostaB.backgroundColor = UIColor.red
        }
    }
    @IBAction func verificaRespC(_ sender: Any) {
        let pergunta = perguntasQuiz[perguntaAtual]
        let certo = pergunta.respostaC.certo
        respostasCertas += certo
        if certo == 1 {
            respostaC.setTitleColor(UIColor.white, for: .normal)
            respostaC.backgroundColor = UIColor.green
            perguntaAtual += 1
            if perguntaAtual == 3{
                proximaTela.isHidden = false
            }else{
                UIView.animate(withDuration: 1.2){
                    self.atualizaPergunta()
                    self.atualizaResposta()
                }
            }
        }else{
        respostaC.setTitleColor(UIColor.white, for: .normal)
        respostaC.backgroundColor = UIColor.red
        }
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
        atualizaPergunta()
        atualizaResposta()
        perguntaAtual = 3
        
    }
    func atualizaPergunta(){
        let pergunta = perguntasQuiz[perguntaAtual]
        perguntaQuiz.text = pergunta.perg
    }
    func atualizaResposta(){
        let pergunta = perguntasQuiz[perguntaAtual]
        respostaA.setTitle(pergunta.respostaA.resp, for: .normal)
        respostaA.setTitleColor(UIColor.systemTeal, for: .normal)
        respostaA.backgroundColor = UIColor.white
        respostaB.setTitle(pergunta.respostaB.resp, for: .normal)
        respostaB.setTitleColor(UIColor.systemTeal, for: .normal)
        respostaB.backgroundColor = UIColor.white
        respostaC.setTitle(pergunta.respostaC.resp, for: .normal)
        respostaC.setTitleColor(UIColor.systemTeal, for: .normal)
        respostaC.backgroundColor = UIColor.white
        respostaD.setTitle(pergunta.respostaD.resp, for: .normal)
        respostaD.setTitleColor(UIColor.systemTeal, for: .normal)
        respostaD.backgroundColor = UIColor.white
        respostaE.setTitle(pergunta.respostaE.resp, for: .normal)
        respostaE.setTitleColor(UIColor.systemTeal, for: .normal)
        respostaE.backgroundColor = UIColor.white
    }
    @IBAction func verificaRespA(_ sender: Any) {
        let pergunta = perguntasQuiz[perguntaAtual]
        let certo = pergunta.respostaA.certo
        respostasCertas += certo
        if certo == 1 {
            respostaA.setTitleColor(UIColor.white, for: .normal)
            respostaA.backgroundColor = UIColor.green
            perguntaAtual += 1
            if perguntaAtual == 7{
                proximaTela.isHidden = false
            }else{
                UIView.animate(withDuration: 1.2){
                    self.atualizaPergunta()
                    self.atualizaResposta()
                }
            }
        }else{
        respostaA.setTitleColor(UIColor.white, for: .normal)
        respostaA.backgroundColor = UIColor.red
        }
    }
    @IBAction func verificaRespB(_ sender: Any) {
        let pergunta = perguntasQuiz[perguntaAtual]
        let certo = pergunta.respostaB.certo
        respostasCertas += certo
        if certo == 1 {
            respostaB.setTitleColor(UIColor.white, for: .normal)
            respostaB.backgroundColor = UIColor.green
            perguntaAtual += 1
            if perguntaAtual == 7{
                proximaTela.isHidden = false
            }else{
                UIView.animate(withDuration: 1.2){
                    self.atualizaPergunta()
                    self.atualizaResposta()
                }
            }
        }else{
        respostaB.setTitleColor(UIColor.white, for: .normal)
        respostaB.backgroundColor = UIColor.red
        }
    }
    @IBAction func verificaRespC(_ sender: Any) {
        let pergunta = perguntasQuiz[perguntaAtual]
        let certo = pergunta.respostaC.certo
        respostasCertas += certo
        if certo == 1 {
            respostaC.setTitleColor(UIColor.white, for: .normal)
            respostaC.backgroundColor = UIColor.green
            perguntaAtual += 1
            if perguntaAtual == 7{
                proximaTela.isHidden = false
            }else{
                UIView.animate(withDuration: 1.2){
                    self.atualizaPergunta()
                    self.atualizaResposta()
                }
            }
        }else{
        respostaC.setTitleColor(UIColor.white, for: .normal)
        respostaC.backgroundColor = UIColor.red
        }
    }
    @IBAction func verificaRespD(_ sender: Any) {
        let pergunta = perguntasQuiz[perguntaAtual]
        let certo = pergunta.respostaD.certo
        respostasCertas += certo
        if certo == 1 {
            respostaD.setTitleColor(UIColor.white, for: .normal)
            respostaD.backgroundColor = UIColor.green
            perguntaAtual += 1
            if perguntaAtual == 7{
                proximaTela.isHidden = false
            }else{
                UIView.animate(withDuration: 1.2){
                    self.atualizaPergunta()
                    self.atualizaResposta()
                }
            }
        }else{
        respostaD.setTitleColor(UIColor.white, for: .normal)
        respostaD.backgroundColor = UIColor.red
        }
    }
    @IBAction func verificaRespE(_ sender: Any) {
        let pergunta = perguntasQuiz[perguntaAtual]
        let certo = pergunta.respostaE.certo
        respostasCertas += certo
        if certo == 1 {
            respostaE.setTitleColor(UIColor.white, for: .normal)
            respostaE.backgroundColor = UIColor.green
            perguntaAtual += 1
            if perguntaAtual == 7{
                proximaTela.isHidden = false
            }else{
                UIView.animate(withDuration: 1.2){
                    self.atualizaPergunta()
                    self.atualizaResposta()
                }
            }
        }else{
        respostaE.setTitleColor(UIColor.white, for: .normal)
        respostaE.backgroundColor = UIColor.red
        }
    }
    
    
}

class QuizFim: UIViewController{
    
    @IBOutlet weak var kimResultado: UIImageView!
    @IBOutlet weak var resultado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultado.text = String(respostasCertas) + " de 10"
    }
    
}
