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
        carregaTexto()
        label.text = ""
        passarCena(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        label.typeWriter()
        label.speed = 4
    }
    
    @IBAction func passarCena(_ sender: Any) {
        //Utilizado com cenas quando imgs estiverem prontas
//        if index < texto.count {
//        label.texto = cenas[index].texto!
//        imgView.changeImage(imageTo: cenas[index].img!)
//        index += 1
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
    // Lista de Imagens
    // 1 - olhandoHorizonte
    // 2 - dormindoSofa
    // 3 -
    func geraCenas(){
        cenas = [Cena(texto: "Era uma vez menino Kleytinho, um jovem recém-formado do ensino médio que sonha em ser um astronauta.", imgName: "olhandoHorizonte"), Cena(texto: "Todos os dias, ele ficava encostado na casa dos pais, sem ajudar nas tarefas econômicas da família.", imgName: "dormindoSofa")]
    }
    //Substituido pelas cenas quando imgs estiverem prontas
    func carregaTexto() {
        self.texto = ["Era uma vez menino \(Personagem.shared.nome!), um jovem recém-formado do ensino médio que sonha em ser um astronauta.","Todos os dias, ele ficava encostado na casa dos pais, sem ajudar nas tarefas econômicas da família.","Mas um dia ele precisou se mudar para outra cidade para estudar Astrofísica.\nPor causa disso, conseguiu seu primeiro emprego e uma moradia em uma república.","Por nunca ter se sustentado antes, se afundou em dívidas…","Mas sua colega de república, Kim, manja muito de economia e vai ajudá-lo a sair dessa!…Ou tentar."]
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
