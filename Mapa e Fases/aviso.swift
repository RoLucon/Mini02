//
//  aviso.swift
//  auto
//
//  Created by Rafael Costa on 03/04/20.
//  Copyright © 2020 Rafael Costa. All rights reserved.
//

import UIKit

var i : intmax_t!
var c = 0 //Representa a fala inicial da fase
//Todas as falas do jogo
let texto = [
1: "fala1",
2: "fala2",
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
var prog = 1 // Representa o progresso do jogador
//Arrays que definem o posicionamento das perguntas durante os dialogos
var q = Array(repeating: 0, count:4)
var q1 = [1, 3, 5, 0]
var q2 = [6, 7, 8, 9]
var q3 = [10, 11, 12, 13]
var q4 = [14, 15, 16, 17]
var q5 = [18, 19, 20, 21]
var q6 = [22, 23, 24, 25]
var q7 = [26, 27, 28, 29]
var q8 = [30, 31, 32, 33]

class popup: UIViewController{
    
    
    @IBOutlet weak var ajuda: UILabel!
    @IBOutlet var pop: UIView!
    @IBOutlet weak var efeito: UIVisualEffectView!
    var effect:UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prog += 1
        effect = efeito.effect
        efeito.effect = nil
        pop.layer.cornerRadius = 5
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
        ajuda.text = "ajuda 1"
    }
    
    @IBAction func p2(_ sender: Any) {
        anima()
        ajuda.text = "ajuda 2"
    }
    
    
    @IBAction func p3(_ sender: Any) {
        anima()
        ajuda.text = "ajuda 3"
    }
    
    @IBAction func fecha(_ sender: AnyObject) {
        animaf()
    }
    
    @IBAction func volta(_ sender: AnyObject) {
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
        perguntas()
    }
    
    @IBAction func r2(_ sender: AnyObject) {
        perguntas()
    }
    
    @IBAction func r3(_ sender: AnyObject) {
        perguntas()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    //Avanças uma fase
    @IBAction func avanca(_ sender: AnyObject) {
    }
    
    //Vai pra fase 1
    @IBAction func f1(_ sender: AnyObject) {
        switch prog {
        case 1:
            i = 1
            q = q1
            c = q[0]
            self.performSegue(withIdentifier: "fase", sender: self)
        default:
            print("ERRO")
        }
    }
    
    //Vai pra fase 2
    @IBAction func f2(_ sender: Any) {
        switch prog {
        case 2:
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
        prog -= 1
        c = q[0]
        i = 1
    }
    
    //Quantidades de caixa de dialogo terão
    @IBAction func telas(_ sender: Any) {
        if c <= q[i]{
            fala?.text = texto[c]
            c += 1
        }
        else{
            self.performSegue(withIdentifier: "Passa", sender: self)
        }
    }
}
