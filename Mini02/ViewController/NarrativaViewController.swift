//
//  NarrativaViewController.swift
//  Mini02
//
//  Created by Rogerio Lucon on 07/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class NarrativaViewController : UIViewController {
    
    var cenas: [Cena]!
    var texto: [String]!
    var index = 0
    @IBOutlet weak var label: TextLabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        carregaTexto()
        geraCenas()
        label.text = ""
        passarCena(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        label.typeWriter()
        label.speed = 4
    }
    
    @IBAction func passarCena(_ sender: Any) {

        if index < cenas.count {
            label.texto = cenas[index].texto!
            imgView.changeImage(imageTo: cenas[index].img!)
            index += 1
        } else {
            let storyboard = UIStoryboard(name: "Principal", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "Principal")
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true, completion: nil)
        }
    }
    // Lista de Imagens ---*  Substituir nome das Imagens pelas Finais  *---
    // 1 - olhando Horizonte
    // 2 - dormindo Sofa com salgadinhos e controle
    // 3 - No Busao olhando pela janela
    // 4 - No escritorio - Cozinhando
    // 5 - Kleytinho desesperado, dinheiro caindo
    // 6 - Kim mostrando a lingua
    // 7 - Entusiasmado
    func geraCenas(){
        cenas = [Cena(texto: "Era uma vez menino \(Personagem.shared.nome!), um jovem recém-formado do ensino médio que sonha em ser um astronauta.", imgName: "01\(Personagem.shared.imgNome!)"),
                 Cena(texto: "Todos os dias, ele ficava encostado na casa dos pais, sem ajudar nas tarefas econômicas da família.", imgName: "02\(Personagem.shared.imgNome!)"),
                 Cena(texto: "Mas um dia ele precisou se mudar para outra cidade para estudar Astrofísica.", imgName: "03\(Personagem.shared.imgNome!)"),
                 Cena(texto: "Por causa disso, conseguiu seu primeiro emprego e uma moradia em uma república.", imgName: "04"),
                 Cena(texto: "Por nunca ter se sustentado antes, se afundou em dívidas…", imgName: "05\(Personagem.shared.imgNome!)"),
                 Cena(texto: "Mas sua colega de república, Kim, manja muito de economia e vai ajudá-lo a sair dessa!", imgName: "06"),
                 Cena(texto: "…Ou tentar.", imgName: "07"),
                 Cena(texto: "Boa sorte, \(Personagem.shared.nome!)!", imgName: "08\(Personagem.shared.imgNome!)")]
    }
    
    struct Cena {
        let texto: String?
        let img: UIImage?
        
        init(texto: String, imgName: String) {
            self.texto = texto
            self.img = UIImage(named: imgName)
        }
    }
}
