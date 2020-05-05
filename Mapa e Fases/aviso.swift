//
//  aviso.swift
//  auto
//
//  Created by Rafael Costa on 03/04/20.
//  Copyright © 2020 Rafael Costa. All rights reserved.
//

import UIKit

func zerafase(){
    switch prog {
    case 2:
        resposta1 = Array(repeating: 0, count:3)
    case 3:
        resposta2 = Array(repeating: 0, count:2)
    case 4:
        resposta3 = Array(repeating: 0, count:3)
    case 5:
        resposta4 = Array(repeating: 0, count:1)
    case 6:
        resposta5 = Array(repeating: 0, count:3)
    case 7:
        resposta6 = Array(repeating: 0, count:2)
    case 8:
        resposta7 = Array(repeating: 0, count:1)
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
        if i >= 6 || q[i+1] == 0{
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
    @IBOutlet weak var setaBanco: UIImageView!
    @IBOutlet weak var passaButton: UIButton!
    @IBOutlet weak var banco: UIButton!
    @IBOutlet weak var fundoFase: UIImageView!
    @IBOutlet var faseView: UIView!
    @IBOutlet weak var kimRosto: UIImageView!
    let notificacao = Notification.Name(rawValue: atualizaSetaBancoNotificationKey)
    
    
    func verifica(){
        if resposta7[0] == 2{
            fim = 2
        }else if Personagem.shared.dinheiro()! >= 10.0{
            fim = 3
        }else{
            fim = 1
        }
    }
    
    func escolhefim(){
        verifica()
        switch fim {
        case 1:
            q = q81
        case 2:
            q = q82
        case 3:
            q = q83
        default:
            print("DEU BAYBLADE AQUI EM!!!")
        }
    }
    
    func dialogo(){
        ApareceSeta(c)
        fala?.text = texto[c]
        print("texto n: " + String(c))
        
        if c == 8 || c == 21 || c == 23 || c == 42 {
            banco?.isUserInteractionEnabled = true
            rosto("kimpiscada")
        }
        
        if pula == true {
            c += 2
            pula = false
        } else {
            c += 1
        }
    }
    func ApareceSeta(_ c:Int){
        if(c == 8 || c == 21 || c == 42){
            setaBanco?.alpha = 0.8
            if c == 8 {
                setaBanco?.transform = CGAffineTransform(translationX: 165, y: 0)
                _ = personagem.dinheiro(1000)
            }
        } else {
            setaBanco?.alpha = 0
        }
    }
    
    func rosto (_ rosto:String) {
        kimRosto?.image = UIImage(named: rosto)
    }
        
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dialogo()
        observer()
        //Progresso de fases
        switch prog {
        case 1:
            fase1?.backgroundColor = nil
            fundoFase?.image = UIImage(named: "parque-1")
            faseView?.backgroundColor = .systemGreen
            setaBanco?.tintColor = .systemRed
            rosto("kimneutra")
        case 2:
            fase2?.backgroundColor = nil
            fundoFase?.image = UIImage(named: "kimTEMPORARIO")
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
    func observer(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.atualizaSetaBanco(notificacao:)), name: notificacao, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(atualizarFala(notificacao:)), name: NSNotification.Name.init("AtualizarTexto"), object: nil)
    }
    @objc func atualizaSetaBanco(notificacao: NSNotification){
        setaBanco?.alpha = 1
        c = 22
        dialogo()
        print("a notificacao chegou")
    }
    
    @objc func atualizarFala(notificacao: NSNotification) {
        c = 9
        banco?.isUserInteractionEnabled = false
        rosto("kimneutra")
        dialogo()
    }
    
    @IBAction func banco(_ sender: Any) {
        print(contadorBanco)
    }
    
    //Avança uma fase
    @IBAction func avanca(_ sender: AnyObject) {
    }
    
    //Vai pra fase 1
    @IBAction func f1(_ sender: AnyObject) {
        contadorBanco = 1
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
            print("ERRO")
        }
    }
    
    //Vai pra fase 2
    @IBAction func f2(_ sender: Any) {
        contadorBanco = 1
        switch prog {
        case 2:
            r = 0
            p = 13
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
        contadorBanco = 1
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
            p = 37
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
            p = 41
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
            p = 53
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
            fim = 3
            r = 0
            p = 81
            a = 60
            i = 1
            escolhefim()
            c = q[0]
            self.performSegue(withIdentifier: "fase", sender: self)
        default:
            print("ERRO")
        }
    }
    
    //Refaz a fase
    @IBAction func refazer(_ sender: Any) {
        if prog == 2 {
            contadorBanco = 1
        }
        
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
            p = 13
            a = 6
        case 3:
            p = 21
            a = 15
        case 4:
            p = 37
            a = 24
        case 5:
            p = 41
            a = 33
        case 6:
            p = 53
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
    @IBAction func telas(_ sender: UIButton) {
        if c != 9 {
            trocaFala()
        }
    }
    func trocaFala(){
        if c <= q[i]{
            dialogo()
        }
        else if c == 13 || c == 23 || c == 37 || c == 44 || c == 60 || c == 72 || c == 78 || c == 83 || c == 89 || c == 96{

            self.performSegue(withIdentifier: "Finalizar", sender: self)
            prog += 1
        }
        else{
            self.performSegue(withIdentifier: "Passa", sender: self)
        }
    }
}
