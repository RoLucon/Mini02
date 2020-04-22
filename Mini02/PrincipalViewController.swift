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
    
    
    @IBOutlet var scorePopover: UIView!
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
  
    @IBAction func scoreInfo(_ sender: Any) {
        self.view.addSubview(scorePopover)
        
        self.tabBarController?.setTabBar(hidden: true, viewController: self)
        
        scorePopover.translatesAutoresizingMaskIntoConstraints = false
        scorePopover.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scorePopover.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        scorePopover.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scorePopover.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        scorePopover.removeFromSuperview()
        
        self.tabBarController?.setTabBar(hidden: false, viewController: self)
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



