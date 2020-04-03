//
//  ViewController.swift
//  Mini02
//
//  Created by Rogerio Lucon on 27/03/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

var nome = "Kleytinho"
var dindin = 0.00
var fala = "Oi, Eu sou o " + nome
var nSemestre = 5
var semestre = String(nSemestre) + " Semestre"
var situacao = " Pendente "

class ViewController: UIViewController {
    
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
     
    let personagem: Personagem = Personagem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        atualizaSaldo()
        atualizaFala()
        atualizaNome()
        atualizaSemestre()
        atualizaSituacao()
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
