//
//  aviso.swift
//  auto
//
//  Created by Rafael Costa on 03/04/20.
//  Copyright © 2020 Rafael Costa. All rights reserved.
//

import UIKit
//Mudar "a" e "p" nas funcoes refazer, f1, f2, f3, f4, f5, f6, f7 e f8 após ter o valor inicial delas para cada fase
var pula = false
var a = 0 //Ajuda da tela atual
var p = 1 //Perguntas e possíveis respostas da tela atual
var i : intmax_t!
var r = 0 //Salva a resposta escolida
var c = 0 //Representa a fala inicial da fase
//Todas as falas do jogo em ordem de aparição
let texto = [
1: "Kleytinho… Hoje é um belo dia.\nOs pássaros estão cantando, o céu está ensolarado…\nE o seu salário caiu.",
2: "Fala aí, Kleytinho!\nRecebeu hoje, né?",
3: "fala3",
4: "fala4",
5: "fala5",
6: "fala6",
7: "fala7",
8: "fala8",
9: "fala9",
10: "fala10",
11: "fala11",
12: "fala12",
13: "fala13",
14: "fala14",
15: "fala15",
16: "fala16",
17: "fala17",
18: "fala18",
19: "fala19",
20: "fala20",
21: "fala21",
22: "fala22",
23: "fala23",
24: "fala24",
25: "fala25",
26: "fala26",
27: "fala27",
28: "fala28",
29: "fala29",
30: "fala30",
31: "fala31",
32: "fala32",
33: "fala33",]

//Todas perguntas do jogo e as respostas possíveis em ordem
let per = [
1: "Partiu gastar tudo no bar?", 2: "Resposta 1 p1", 3: "Resposta 2 p1", 4: "Resposta 3 p1",
5: "Pergunta 2", 6: "Resposta 1 p2", 7: "Resposta 2 p2", 8: "Resposta 3 p2",
9: "Pergunta 3", 10: "Resposta 1 p3", 11: "Resposta 2 p3", 12: "Resposta 3 p3",
13: "Pergunta 4", 14: "Resposta 1 p4", 15: "Resposta 2 p4", 16: "Resposta 3 p4",
17: "Pergunta 5", 18: "Resposta 1 p5", 19: "Resposta 2 p5", 20: "Resposta 3 p5",
21: "Pergunta 6", 22: "Resposta 1 p6", 23: "Resposta 2 p6", 24: "Resposta 3 p6",
25: "Pergunta 7", 26: "Resposta 1 p7", 27: "Resposta 2 p7", 28: "Resposta 3 p7",
29: "Pergunta 8", 30: "Resposta 1 p8", 31: "Resposta 2 p8", 32: "Resposta 3 p8",
33: "Pergunta 9", 34: "Resposta 1 p9", 35: "Resposta 2 p9", 36: "Resposta 3 p9",
37: "Pergunta 10", 38: "Resposta 1 p10", 39: "Resposta 2 p10", 40: "Resposta 3 p10",
41: "Pergunta 11", 42: "Resposta 1 p11", 43: "Resposta 2 p11", 44: "Resposta 3 p11",
45: "Pergunta 12", 46: "Resposta 1 p12", 47: "Resposta 2 p12", 48: "Resposta 3 p12",
49: "Pergunta 13", 50: "Resposta 1 p13", 51: "Resposta 2 p13", 52: "Resposta 3 p13",
53: "Pergunta 14", 54: "Resposta 1 p14", 55: "Resposta 2 p14", 56: "Resposta 3 p14",
57: "Pergunta 15", 58: "Resposta 1 p15", 59: "Resposta 2 p15", 60: "Resposta 3 p15",
61: "Pergunta 16", 62: "Resposta 1 p16", 63: "Resposta 2 p16", 64: "Resposta 3 p16",
65: "Pergunta 17", 66: "Resposta 1 p17", 67: "Resposta 2 p17", 68: "Resposta 3 p17",
69: "Pergunta 18", 70: "Resposta 1 p18", 71: "Resposta 2 p18", 72: "Resposta 3 p18",
73: "Pergunta 19", 74: "Resposta 1 p19", 75: "Resposta 2 p19", 76: "Resposta 3 p19",
77: "Pergunta 20", 78: "Resposta 1 p20", 79: "Resposta 2 p20", 80: "Resposta 3 p20",
81: "Pergunta 21", 82: "Resposta 1 p21", 83: "Resposta 2 p21", 84: "Resposta 3 p21",
85: "Pergunta 22", 86: "Resposta 1 p22", 87: "Resposta 2 p22", 88: "Resposta 3 p22",
89: "Pergunta 23", 90: "Resposta 1 p23", 91: "Resposta 2 p23", 92: "Resposta 3 p23",
]


//Todas as explicações presentes nas fases
let help = [
"Ajuda 1 p1", "Ajuda 2 p1", "Ajuda 3 p1",
"Ajuda 1 p2", "Ajuda 2 p2", "Ajuda 3 p2",
"Ajuda 1 p3", "Ajuda 2 p3", "Ajuda 3 p3",
"Ajuda 1 p4", "Ajuda 2 p4", "Ajuda 3 p4",
"Ajuda 1 p5", "Ajuda 2 p5", "Ajuda 3 p5",
"Ajuda 1 p6", "Ajuda 2 p6", "Ajuda 3 p6",
"Ajuda 1 p7", "Ajuda 2 p7", "Ajuda 3 p7",
"Ajuda 1 p8", "Ajuda 2 p8", "Ajuda 3 p8",
"Ajuda 1 p9", "Ajuda 2 p9", "Ajuda 3 p9",
"Ajuda 1 p10", "Ajuda 2 p10", "Ajuda 3 p10",
"Ajuda 1 p11", "Ajuda 2 p11", "Ajuda 3 p11",
"Ajuda 1 p12", "Ajuda 2 p12", "Ajuda 3 p12",
"Ajuda 1 p13", "Ajuda 2 p13", "Ajuda 3 p13",
"Ajuda 1 p14", "Ajuda 2 p14", "Ajuda 3 p14",
"Ajuda 1 p15", "Ajuda 2 p15", "Ajuda 3 p15",
"Ajuda 1 p16", "Ajuda 2 p16", "Ajuda 3 p16",
"Ajuda 1 p17", "Ajuda 2 p17", "Ajuda 3 p17",
"Ajuda 1 p18", "Ajuda 2 p18", "Ajuda 3 p18",
"Ajuda 1 p19", "Ajuda 2 p19", "Ajuda 3 p19",
"Ajuda 1 p20", "Ajuda 2 p20", "Ajuda 3 p20",
"Ajuda 1 p21", "Ajuda 2 p21", "Ajuda 3 p21",
"Ajuda 1 p22", "Ajuda 2 p22", "Ajuda 3 p22",
"Ajuda 1 p23", "Ajuda 2 p23", "Ajuda 3 p23",
]
var prog = 1 // Representa o progresso do jogador
//Arrays que definem o posicionamento das perguntas durante os dialogos
//Casa 0: Fala inicial; Casa 1: Última fala antes da primeira pergunta; Casa 2: Última casa antes da segunda pergunta...
//Colocar 0 caso já tenha acabado
var q = Array(repeating: 0, count:4)
var q1 = [1, 2, 5, 0]
var q2 = [6, 7, 8, 9]
var q3 = [10, 11, 12, 13]
var q4 = [14, 15, 16, 17]
var q5 = [18, 19, 20, 21]
var q6 = [22, 23, 24, 25]
var q7 = [26, 27, 28, 29]
var q8 = [30, 31, 32, 33]

//Arrays que salvarão as respostas
var resposta1 = Array(repeating: 0, count:2)
var resposta2 = Array(repeating: 0, count:3)
var resposta3 = Array(repeating: 0, count:3)
var resposta4 = Array(repeating: 0, count:3)
var resposta5 = Array(repeating: 0, count:3)
var resposta6 = Array(repeating: 0, count:3)
var resposta7 = Array(repeating: 0, count:3)
var resposta8 = Array(repeating: 0, count:3)

func zerafase(){
    switch prog {
    case 2:
        resposta1 = Array(repeating: 0, count:2)
    case 3:
        resposta2 = Array(repeating: 0, count:3)
    case 4:
        resposta3 = Array(repeating: 0, count:3)
    case 5:
        resposta4 = Array(repeating: 0, count:3)
    case 6:
        resposta5 = Array(repeating: 0, count:3)
    case 7:
        resposta6 = Array(repeating: 0, count:3)
    case 8:
        resposta7 = Array(repeating: 0, count:3)
    case 9:
        resposta8 = Array(repeating: 0, count:3)
    default:
        print("n era para isso acontecer")
    }
}

class popup: UIViewController{
    
    @IBOutlet weak var questao: UILabel!
    @IBOutlet weak var resp1: UIButton!
    @IBOutlet weak var resp2: UIButton!
    @IBOutlet weak var ajuda: UILabel!
    @IBOutlet var pop: UIView!
    @IBOutlet weak var efeito: UIVisualEffectView!
    var effect:UIVisualEffect!
    
    //Funçào que apresenta a pergunta e as respostas possíveis
    func mostraper(){
        questao.text = per[p]
        resp1.setTitle(per[p+1], for: .normal)
        resp2.setTitle(per[p+2], for: .normal)
        p += 4
    }
    
    func salvaresp (x: intmax_t){
        switch prog {
        case 2:
            resposta1[r] = x
        case 3:
            resposta2[r] = x
        case 4:
            resposta3[r] = x
        case 5:
            resposta4[r] = x
        case 6:
            resposta5[r] = x
        case 7:
            resposta6[r] = x
        case 8:
            resposta7[r] = x
        case 9:
            resposta8[r] = x
        default:
            print("n era para isso acontecer")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prog += 1
        effect = efeito.effect
        efeito.effect = nil
        pop.layer.cornerRadius = 5
        mostraper()
    }
    
    func anima(){
        self.view.addSubview(pop)
        pop.center = self.view.center
        pop.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        pop.alpha = 0
        
        UIView.animate(withDuration: 0.4){
            self.efeito.effect = self.effect
            self.pop.alpha = 1
            self.pop.transform = CGAffineTransform.identity
        }
    }
    
    func animaf(){
        UIView.animate(withDuration: 0.3, animations: {
            self.pop.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.pop.alpha = 0
            
            self.efeito.effect = nil
            
        }){ (success: Bool) in
            self.pop.removeFromSuperview()
        }
    }
    
    @IBAction func p1(_ sender: AnyObject) {
        anima()
        ajuda.text = help[a]
    }
    
    @IBAction func p2(_ sender: Any) {
        anima()
        ajuda.text = help[a+1]
    }
    
    @IBAction func fecha(_ sender: AnyObject) {
        animaf()
    }
    
    @IBAction func volta(_ sender: AnyObject) {
        zerafase()
        r = 0
        prog -= 1
    }
    
    func perguntas(){
        if i >= 3 || q[i+1] == 0{
            self.performSegue(withIdentifier: "Finaliza", sender: self)
        }
        else {
            self.performSegue(withIdentifier: "Continua", sender: self)
            i += 1
            prog -= 1
        }
    }
    
    @IBAction func r1(_ sender: AnyObject) {
        a += 3
        salvaresp(x: 1)
        perguntas()
        r += 1
        pula = true
    }
    
    @IBAction func r2(_ sender: AnyObject) {
        a += 3
        salvaresp(x: 2)
        perguntas()
        r += 1
        pula = false
        c+=1
    }
}

class selecf: UIViewController{
    @IBOutlet weak var fala: UILabel!
    @IBOutlet weak var fase1: UIButton!
    @IBOutlet weak var fase2: UIButton!
    @IBOutlet weak var fase3: UIButton!
    @IBOutlet weak var fase4: UIButton!
    @IBOutlet weak var fase5: UIButton!
    @IBOutlet weak var fase6: UIButton!
    @IBOutlet weak var fase7: UIButton!
    @IBOutlet weak var fase8: UIButton!
    
    func dialogo(){
        fala?.text = texto[c]
        if pula == true {
            c += 2
            pula = false
        } else {
            c += 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dialogo()
        //Progresso de fases
        switch prog {
        case 1:
            fase1?.backgroundColor = nil
        case 2:
            fase2?.backgroundColor = nil
        case 3:
            fase3?.backgroundColor = nil
        case 4:
            fase4?.backgroundColor = nil
        case 5:
            fase5?.backgroundColor = nil
        case 6:
            fase6?.backgroundColor = nil
        case 7:
            fase7?.backgroundColor = nil
        case 8:
            fase8?.backgroundColor = nil
        default:
            print("ERRO")
        }
    }
    //Avança uma fase
    @IBAction func avanca(_ sender: AnyObject) {
    }
    
    //Vai pra fase 1
    @IBAction func f1(_ sender: AnyObject) {
        switch prog {
        case 1:
            r = 0
            p = 1
            a = 0
            i = 1
            q = q1
            c = q[0]
            self.performSegue(withIdentifier: "fase", sender: self)
        default:
            print("1:")
            for valor in resposta1{
                print(valor)
            }
            print("\n2:")
            for valor in resposta2{
                print(valor)
            }
            print("\n3:")
            for valor in resposta3{
                print(valor)
            }
            print("\n4:")
            for valor in resposta4{
                print(valor)
            }
            print("\n5:")
            for valor in resposta5{
                print(valor)
            }
            print("\n6:")
            for valor in resposta6{
                print(valor)
            }
            print("\n7:")
            for valor in resposta7{
                print(valor)
            }
            print("\n8:")
            for valor in resposta8{
                print(valor)
            }
        }
    }
    
    //Vai pra fase 2
    @IBAction func f2(_ sender: Any) {
        switch prog {
        case 2:
            r = 0
            p = 9
            a = 6
            i = 1
            q = q2
            c = q[0]
            self.performSegue(withIdentifier: "fase", sender: self)
        default:
            print("ERRO")
        }
    }
    
    //Vai pra fase 3
    @IBAction func f3(_ sender: AnyObject) {
        switch prog {
        case 3:
            r = 0
            p = 21
            a = 15
            i = 1
            q = q3
            c = q[0]
            self.performSegue(withIdentifier: "fase", sender: self)
        default:
            print("ERRO")
        }
    }
    
    //Vai pra fase 4
    @IBAction func f4(_ sender: AnyObject) {
        switch prog {
        case 4:
            r = 0
            p = 33
            a = 24
            i = 1
            q = q4
            c = q[0]
            self.performSegue(withIdentifier: "fase", sender: self)
        default:
            print("ERRO")
        }
    }
    
    //Vai pra fase 5
    @IBAction func f5(_ sender: AnyObject) {
        switch prog {
        case 5:
            r = 0
            p = 45
            a = 33
            i = 1
            q = q5
            c = q[0]
            self.performSegue(withIdentifier: "fase", sender: self)
        default:
            print("ERRO")
        }
    }
    
    //Vai pra fase 6
    @IBAction func f6(_ sender: AnyObject) {
        switch prog {
        case 6:
            r = 0
            p = 57
            a = 42
            i = 1
            q = q6
            c = q[0]
            self.performSegue(withIdentifier: "fase", sender: self)
        default:
            print("ERRO")
        }
    }
    
    //Vai pra fase 7
    @IBAction func f7(_ sender: AnyObject) {
        switch prog {
        case 7:
            r = 0
            p = 69
            a = 51
            i = 1
            q = q7
            c = q[0]
            self.performSegue(withIdentifier: "fase", sender: self)
        default:
            print("ERRO")
        }
    }
    
    //Vai pra fase 8
    @IBAction func f8(_ sender: AnyObject) {
        switch prog {
        case 8:
            r = 0
            p = 81
            a = 60
            i = 1
            q = q8
            c = q[0]
            self.performSegue(withIdentifier: "fase", sender: self)
        default:
            print("ERRO")
        }
    }
    
    //Refaz a fase
    @IBAction func refazer(_ sender: Any) {
        zerafase()
        r = 0
        prog -= 1
        c = q[0]
        i = 1
        
        switch prog {
        case 1:
            p = 1
            a = 0
        case 2:
            p = 9
            a = 6
        case 3:
            p = 21
            a = 15
        case 4:
            p = 33
            a = 24
        case 5:
            p = 45
            a = 33
        case 6:
            p = 57
            a = 42
        case 7:
            p = 69
            a = 51
        case 8:
            p = 81
            a = 60
        default:
            print("UÉ")
        }
        
    }
    
    //Quantidades de caixa de dialogo terão
    @IBAction func telas(_ sender: Any) {
        if c <= q[i]{
            dialogo()
        }
        else{
            self.performSegue(withIdentifier: "Passa", sender: self)
        }
    }
}
