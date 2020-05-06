//
//  ImpostoDeRenda.swift
//  Mini02
//
//  Created by Gustavo Rigor on 04/05/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class ImpRenda: UIViewController {

    @IBOutlet weak var teste: UILabel!
    @IBOutlet weak var nome: UILabel!
    let personagem: Personagem = Personagem.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teste.text = """
        A entrega de declaração do
        IRPF 2020 foi prorrogado até
        30/junho/2020 e poderá ser
        feita em computadores,
        celulares e tablets.
        """
        nome.text =  (personagem.nome + " NEIL PONTES").uppercased()
    }
    
}

class ImpRendaSair: UIViewController{
    let personagem: Personagem = Personagem.shared
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var falaKim: UILabel!
    @IBOutlet weak var Sair: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nome.text =  (personagem.nome + " NEIL PONTES.").uppercased()
    }
    @IBAction func proximaFala(_ sender: Any) {
        falaKim.text = "Você ainda não tem que o declarar...Vamos, feche esse app e vamos tomar um sorvete."
        Sair.isHidden = false
    }
    @IBAction func sairDaTela(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name.init("AtualizarBotao"), object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
}
