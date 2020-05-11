//
//  ViewController.swift
//  Mini02
//
//  Created by Rogerio Lucon on 27/03/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit
import AVFoundation

func zeraContadorBanco(){
    contadorBanco = 0
}

var situacao = " Pendente "

let atualizaRendimentosNotificationKey = "co.gusrigor.atualizaRendimento"
let atualizaFalaNotificationKey = "co.gusrigor.atualizaFala"
let atualizaSetaBancoNotificationKey = "co.gusrigor.atualizaSetaBanco"

class ViewController: UIViewController {
    @IBOutlet weak var personagemSituacao: UIImageView!
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
    var configView: ConfigView?
    var personagem: Personagem = Personagem.shared
    
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
        zeraContadorBanco()
        //play.para()
        if ConfigView.isMusic{
            play.toca(music: "padrao2.mp3")
        }
        // Do any additional setup after loading the view.
    }
  

    @IBAction func configuracao(_ sender: Any) {
        if configView == nil {
            configView = ConfigView(frame: view.frame, viewController: self)
        }
        configView?.mostrarTabBar(value: false)
        view.addSubview(configView!)
        configView?.translatesAutoresizingMaskIntoConstraints = false
        configView?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        configView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        configView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        configView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
  
    @IBAction func scoreInfo(_ sender: Any) {
        if !scorePopover.isDescendant(of: self.view){
            self.view.addSubview(scorePopover)
            
            self.tabBarController?.setTabBar(hidden: true, viewController: self)
            
            scorePopover.translatesAutoresizingMaskIntoConstraints = false
            scorePopover.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            scorePopover.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            scorePopover.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            scorePopover.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        } else {
            print("Ja e filho")
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        scorePopover.removeFromSuperview()
        configView?.dismiss()
        self.tabBarController?.setTabBar(hidden: false, viewController: self)
    }
    
    func observer(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.atualizarFala(notificacao:)), name: NSNotification.Name.init("AtualizarTexto"), object: nil)
    }
  
    @objc func atualizarFala(notificacao: NSNotification){
        print("a notificacao chegou")
        atualizaSaldo()
        atualizaFala()
        
        
    }
    //Funcao para atualizar o saldo ao iniciar a tela
    func atualizaSaldo(){
        personagem = Personagem.shared
        Dinheiro.text = String(format:"R$ %.2f", personagem.dinheiro(nil)!).replacingOccurrences(of: ".", with: ",")
    }
    //Funcao para atualizar a fala da personagem ao carregar a tela
    func atualizaFala(){
        personagem = Personagem.shared
        let temp:Int? = personagem.score(nil)
        if(temp!>650){
            FalaPrsonagem.text = bom[Int.random(in: 0 ... 3)]
            personagemSituacao.image=UIImage(named:"\(Personagem.shared.imgNome!)feliz")
        }else if(temp!>350){
            FalaPrsonagem.text = medio[Int.random(in: 0 ... 4)]
            personagemSituacao.image=UIImage(named:"\(Personagem.shared.imgNome!)neutro")
        }else{
            FalaPrsonagem.text = ruim[Int.random(in: 0 ... 4)]
            personagemSituacao.image=UIImage(named:"\(Personagem.shared.imgNome!)triste")
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
    @IBAction func tocamusica(_ sender: Any) {
        if ConfigView.isMusic{
            play.para()
            play1.toca(music: "coin.mp3")
            play.toca(music: "padrao.mp3")
        }
    }
}


