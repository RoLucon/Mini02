//
//  Quiz.swift
//  Mini02
//
//  Created by Gustavo Rigor on 29/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//t

import Foundation
import UIKit

var perguntaAtual = 0
var respostasCertas = 0.0

struct Resposta {
    var resp = "algum texto"
    var certo = 1.0 //-1 é errado 1 é certo
}
struct Pergunta {
    var perg = "algum texto"
    var respostaA = Resposta()
    var respostaB = Resposta()
    var respostaC = Resposta()
    var respostaD = Resposta()
    var respostaE = Resposta()
}

let perguntasQuiz = [Pergunta(perg: "O cartão de crédito é uma despesa fixa ou variável?",respostaA: Resposta(resp: "Variável", certo: 1.0), respostaB: Resposta(resp: "Fixa", certo: -1.0),respostaC: Resposta(resp: "Nenhum do dois", certo: -1.0)),Pergunta(perg: "A faculdade é uma despesa...",respostaA: Resposta(resp: "Variável", certo: -1.0), respostaB: Resposta(resp: "Fixa", certo: 1.0),respostaC: Resposta(resp: "Nenhum do dois", certo: -1.0)),Pergunta(perg: "Gastos médicos são despesas...",respostaA: Resposta(resp: "Variáveis", certo: 1.0), respostaB: Resposta(resp: "Fixas", certo: -1.0),respostaC: Resposta(resp: "Nenhum do dois", certo: -1.0)),Pergunta(perg: "Quanto é aconselhável guardar na reserva de emergência?",respostaA: Resposta(resp: "Entre 4 a 8 salários atuais", certo: -1.0), respostaB: Resposta(resp: "Entre 10 a 12 salários atuais", certo: -1.0),respostaC: Resposta(resp: "7 salários atuais", certo: -1.0),respostaD: Resposta(resp: "Entre 3 a 6 salários atuais", certo: 1.0), respostaE: Resposta(resp: "4 salários atuais", certo: -1.0)),Pergunta(perg: "Sobre a reserva de emergência, é correto afirmar...",respostaA: Resposta(resp: "Não serve para empregados.", certo: -1.0), respostaB: Resposta(resp: "Te sustenta por 3 meses.", certo: 1.0),respostaC: Resposta(resp: "É para comprar eletrodomésticos.", certo: -1.0),respostaD: Resposta(resp: "Só serve para empregos instáveis.", certo: -1.0), respostaE: Resposta(resp: "Deve-se fazer para sair da firma.", certo: -1.0)),Pergunta(perg: "Quais dessas despesas são fixas?",respostaA: Resposta(resp: "Lanches no BK", certo: -1.0), respostaB: Resposta(resp: "Condomíno", certo: 0.5),respostaC: Resposta(resp: "Rolê no posto", certo: -1.0),respostaD: Resposta(resp: "Assinatura da Netflix", certo: 0.5), respostaE: Resposta(resp: "Sorvete", certo: -1.0)), Pergunta(perg: "Quais dessas despesas são variáveis?",respostaA: Resposta(resp: "Boot novo", certo: 0.3), respostaB: Resposta(resp: "Mensalidade da facul", certo: -1.0),respostaC: Resposta(resp: "Bar do Bode", certo: 0.3),respostaD: Resposta(resp: "Plano de telefone", certo: -1.0), respostaE: Resposta(resp: "Cineminha com a Kim", certo: 0.4))]


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
        respostaA.setTitleColor(#colorLiteral(red: 0.5137254902, green: 0.4392156863, blue: 0.3215686275, alpha: 1), for: .normal)
        respostaA.backgroundColor = UIColor.white
        respostaB.setTitle(pergunta.respostaB.resp, for: .normal)
        respostaB.setTitleColor(#colorLiteral(red: 0.5137254902, green: 0.4392156863, blue: 0.3215686275, alpha: 1), for: .normal)
        respostaB.backgroundColor = UIColor.white
        respostaC.setTitle(pergunta.respostaC.resp, for: .normal)
        respostaC.setTitleColor(#colorLiteral(red: 0.5137254902, green: 0.4392156863, blue: 0.3215686275, alpha: 1), for: .normal)
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
                respostaA.isEnabled = false
                respostaB.isEnabled = false
                respostaC.isEnabled = false
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
                respostaA.isEnabled = false
                respostaB.isEnabled = false
                respostaC.isEnabled = false
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
                respostaA.isEnabled = false
                respostaB.isEnabled = false
                respostaC.isEnabled = false
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
    var certo = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaPergunta()
        atualizaResposta()
        certo = 0.0
        perguntaAtual = 3
        
    }
    func atualizaPergunta(){
        let pergunta = perguntasQuiz[perguntaAtual]
        perguntaQuiz.text = pergunta.perg
    }
    func atualizaResposta(){
        let pergunta = perguntasQuiz[perguntaAtual]
        respostaA.setTitle(pergunta.respostaA.resp, for: .normal)
        respostaA.setTitleColor(#colorLiteral(red: 0.5137254902, green: 0.4392156863, blue: 0.3215686275, alpha: 1), for: .normal)
        respostaA.backgroundColor = UIColor.white
        respostaB.setTitle(pergunta.respostaB.resp, for: .normal)
        respostaB.setTitleColor(#colorLiteral(red: 0.5137254902, green: 0.4392156863, blue: 0.3215686275, alpha: 1), for: .normal)
        respostaB.backgroundColor = UIColor.white
        respostaC.setTitle(pergunta.respostaC.resp, for: .normal)
        respostaC.setTitleColor(#colorLiteral(red: 0.5137254902, green: 0.4392156863, blue: 0.3215686275, alpha: 1), for: .normal)
        respostaC.backgroundColor = UIColor.white
        respostaD.setTitle(pergunta.respostaD.resp, for: .normal)
        respostaD.setTitleColor(#colorLiteral(red: 0.5137254902, green: 0.4392156863, blue: 0.3215686275, alpha: 1), for: .normal)
        respostaD.backgroundColor = UIColor.white
        respostaE.setTitle(pergunta.respostaE.resp, for: .normal)
        respostaE.setTitleColor(#colorLiteral(red: 0.5137254902, green: 0.4392156863, blue: 0.3215686275, alpha: 1), for: .normal)
        respostaE.backgroundColor = UIColor.white
    }
    @IBAction func verificaRespA(_ sender: Any) {
        let pergunta = perguntasQuiz[perguntaAtual]
        let tempCerto = pergunta.respostaA.certo
        respostasCertas += tempCerto
        if tempCerto > 0.0 {
            certo += tempCerto
            respostaA.setTitleColor(UIColor.white, for: .normal)
            respostaA.backgroundColor = UIColor.green
            if certo == 1.0 {
                perguntaAtual += 1
                certo = 0
                if perguntaAtual == 7{
                    respostaA.isEnabled = false
                    respostaB.isEnabled = false
                    respostaC.isEnabled = false
                    respostaD.isEnabled = false
                    respostaE.isEnabled = false
                    proximaTela.isHidden = false
                }else{
                    UIView.animate(withDuration: 1.2){
                        self.atualizaPergunta()
                        self.atualizaResposta()
                    }
                }
            }
        }else{
        respostaA.setTitleColor(UIColor.white, for: .normal)
        respostaA.backgroundColor = UIColor.red
        }
    }
    @IBAction func verificaRespB(_ sender: Any) {
        let pergunta = perguntasQuiz[perguntaAtual]
        let tempCerto = pergunta.respostaB.certo
        respostasCertas += tempCerto
        if tempCerto > 0.0 {
            certo += tempCerto
            respostaB.setTitleColor(UIColor.white, for: .normal)
            respostaB.backgroundColor = UIColor.green
            if certo == 1.0 {
                perguntaAtual += 1
                certo = 0
                if perguntaAtual == 7{
                    respostaA.isEnabled = false
                    respostaB.isEnabled = false
                    respostaC.isEnabled = false
                    respostaD.isEnabled = false
                    respostaE.isEnabled = false
                    proximaTela.isHidden = false
                }else{
                    UIView.animate(withDuration: 1.2){
                        self.atualizaPergunta()
                        self.atualizaResposta()
                    }
                }
            }
        }else{
        respostaB.setTitleColor(UIColor.white, for: .normal)
        respostaB.backgroundColor = UIColor.red
        }
    }
    @IBAction func verificaRespC(_ sender: Any) {
        let pergunta = perguntasQuiz[perguntaAtual]
        let tempCerto = pergunta.respostaC.certo
        respostasCertas += tempCerto
        if tempCerto > 0.0 {
            certo += tempCerto
            respostaC.setTitleColor(UIColor.white, for: .normal)
            respostaC.backgroundColor = UIColor.green
            if certo == 1.0 {
                perguntaAtual += 1
                certo = 0
                if perguntaAtual == 7{
                    respostaA.isEnabled = false
                    respostaB.isEnabled = false
                    respostaC.isEnabled = false
                    respostaD.isEnabled = false
                    respostaE.isEnabled = false
                    proximaTela.isHidden = false
                }else{
                    UIView.animate(withDuration: 1.2){
                        self.atualizaPergunta()
                        self.atualizaResposta()
                    }
                }
            }
        }else{
        respostaC.setTitleColor(UIColor.white, for: .normal)
        respostaC.backgroundColor = UIColor.red
        }
    }
    @IBAction func verificaRespD(_ sender: Any) {
        let pergunta = perguntasQuiz[perguntaAtual]
        let tempCerto = pergunta.respostaD.certo
        respostasCertas += tempCerto
        if tempCerto > 0.0 {
            certo += tempCerto
            respostaD.setTitleColor(UIColor.white, for: .normal)
            respostaD.backgroundColor = UIColor.green
            if certo == 1.0 {
                perguntaAtual += 1
                certo = 0
                if perguntaAtual == 7{
                    respostaA.isEnabled = false
                    respostaB.isEnabled = false
                    respostaC.isEnabled = false
                    respostaD.isEnabled = false
                    respostaE.isEnabled = false
                    proximaTela.isHidden = false
                }else{
                    UIView.animate(withDuration: 1.2){
                        self.atualizaPergunta()
                        self.atualizaResposta()
                    }
                }
            }
        }else{
        respostaD.setTitleColor(UIColor.white, for: .normal)
        respostaD.backgroundColor = UIColor.red
        }
    }
    @IBAction func verificaRespE(_ sender: Any) {
        let pergunta = perguntasQuiz[perguntaAtual]
        let tempCerto = pergunta.respostaE.certo
        respostasCertas += tempCerto
        if tempCerto > 0.0 {
            certo += tempCerto
            respostaE.setTitleColor(UIColor.white, for: .normal)
            respostaE.backgroundColor = UIColor.green
            if certo == 1.0 {
                perguntaAtual += 1
                certo = 0
                if perguntaAtual == 7{
                    respostaA.isEnabled = false
                    respostaB.isEnabled = false
                    respostaC.isEnabled = false
                    respostaD.isEnabled = false
                    respostaE.isEnabled = false
                    proximaTela.isHidden = false
                }else{
                    UIView.animate(withDuration: 1.2){
                        self.atualizaPergunta()
                        self.atualizaResposta()
                    }
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
        resultado.text = String(format:"%1.0f",respostasCertas+2) + " de 10"
    }
    
    func imagemResultado(){
        if respostasCertas < 5 {
            //kim triste
            kimResultado.changeImage(imageTo: UIImage(named: "kimfb-bom")!)
        }else if respostasCertas > 6 {
            //kim feliz
            kimResultado.changeImage(imageTo: UIImage(named: "kimfb-bom")!)
        }else{
            //kim muito feliz
            kimResultado.changeImage(imageTo: UIImage(named: "kimfb-ruim")!)
        }
    }
    
    @IBAction func voltarGame(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name.init("AtualizarBotao"), object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
}
