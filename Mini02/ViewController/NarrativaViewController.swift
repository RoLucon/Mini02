//
//  NarrativaViewController.swift
//  Mini02
//
//  Created by Rogerio Lucon on 07/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class NarrativaViewController : UIViewController {
    
    var texto: [String]!
    var index = 0
    @IBOutlet weak var label: TextLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carregaTexto()
        label.text = ""
        passarTexto(self)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        label.typeWriter()
        label.speed = 4
    }
    
    @IBAction func passarTexto(_ sender: Any) {
        if index < texto.count {
            label.texto = texto[index]
            index += 1
        } else {
            let storyboard = UIStoryboard(name: "Principal", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "Principal")
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    func carregaTexto() {
        self.texto = ["Era uma vez menino Kleytinho, um jovem recém-formado do ensino médio que sonha em ser um astronauta.","Todos os dias, ele ficava encostado na casa dos pais, sem ajudar nas tarefas econômicas da família.","Mas um dia ele precisou se mudar para outra cidade para estudar Astrofísica.\nPor causa disso, conseguiu seu primeiro emprego e uma moradia em uma república.","Por nunca ter se sustentado antes, se afundou em dívidas…","Mas sua colega de república, Kim, manja muito de economia e vai ajudá-lo a sair dessa!…Ou tentar."]
    }
}
