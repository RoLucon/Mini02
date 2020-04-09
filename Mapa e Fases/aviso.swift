//
//  aviso.swift
//  auto
//
//  Created by Rafael Costa on 03/04/20.
//  Copyright © 2020 Rafael Costa. All rights reserved.
//

import UIKit

var refaz = 0
var contador = 0 /*  O contador representa o número de caixas de dialogo que terá na fase menos 1
                     (caso tenha 1 caixa, o contador valerá 0)
                     Seleção de contador na classe selecf*/
var prog = 1 // Representa o progresso do jogador

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
        //prog += 1
    }
    
    //Vai pra fase 1
    @IBAction func f1(_ sender: AnyObject) {
        switch prog {
        case 1:
            contador = 2
            refaz = contador
            self.performSegue(withIdentifier: "fase", sender: self)
        default:
            print("ERRO")
        }
    }
    
    //Vai pra fase 2
    @IBAction func f2(_ sender: Any) {
        switch prog {
        case 2:
            contador = 2
            refaz = contador
            self.performSegue(withIdentifier: "fase", sender: self)
        default:
            print("ERRO")
        }
    }
    
    //Vai pra fase 3
    @IBAction func f3(_ sender: AnyObject) {
        switch prog {
        case 3:
            contador = 2
            refaz = contador
            self.performSegue(withIdentifier: "fase", sender: self)
        default:
            print("ERRO")
        }
    }
    
    //Vai pra fase 4
    @IBAction func f4(_ sender: AnyObject) {
        switch prog {
        case 4:
            contador = 1
            refaz = contador
            self.performSegue(withIdentifier: "fase", sender: self)
        default:
            print("ERRO")
        }
    }
    
    //Vai pra fase 5
    @IBAction func f5(_ sender: AnyObject) {
        switch prog {
        case 5:
            contador = 4
            refaz = contador
            self.performSegue(withIdentifier: "fase", sender: self)
        default:
            print("ERRO")
        }
    }
    
    //Vai pra fase 6
    @IBAction func f6(_ sender: AnyObject) {
        switch prog {
        case 6:
            contador = 0
            refaz = contador
            self.performSegue(withIdentifier: "fase", sender: self)
        default:
            print("ERRO")
        }
    }
    
    //Vai pra fase 7
    @IBAction func f7(_ sender: AnyObject) {
        switch prog {
        case 7:
            contador = 1
            refaz = contador
            self.performSegue(withIdentifier: "fase", sender: self)
        default:
            print("ERRO")
        }
    }
    
    //Vai pra fase 8
    @IBAction func f8(_ sender: AnyObject) {
        switch prog {
        case 8:
            contador = 3
            refaz = contador
            self.performSegue(withIdentifier: "fase", sender: self)
        default:
            print("ERRO")
        }
    }
    
    //Refaz a fase
    @IBAction func refazer(_ sender: Any) {
        contador = refaz
        prog -= 1
    }
    
    //Quantidades de caixa de dialogo terão
    @IBAction func telas(_ sender: Any) {
        switch contador {
        case 1:
            fala?.text = "Ultima fala"
            contador -= 1
            
        case 2:
            fala?.text = "Penultima fala"
            contador -= 1
            
        case 3:
            fala?.text = "Ante-penultima fala"
            contador -= 1
        
        case 4:
            fala?.text = "Segunda fala"
            contador -= 1
            
        case 0:
            self.performSegue(withIdentifier: "Passa", sender: self)
        default:
            fala?.text = "erro"
        }
    }
}
