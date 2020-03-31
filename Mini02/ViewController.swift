//
//  ViewController.swift
//  Mini02
//
//  Created by Rogerio Lucon on 27/03/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var dindin = 0.00
    var fala = "Oi, Eu sou o Kleytinho"
    
    //Fala da personagem no campo da tela de intro
    @IBOutlet weak var FalaPrsonagem: UITextView!
    //A quantidade de dinheiro da personagem no jogo
    @IBOutlet weak var Dinheiro: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaSaldo()
        atualizaFala()
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

    

}
