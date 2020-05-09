//
//  IntroducaoViewController.swift
//  Mini02
//
//  Created by Rogerio Lucon on 30/03/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class IntroducaoViewController: UIViewController {
    
    @IBOutlet weak var imginicial: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        play.toca(music: "padrao4.mp3")
        NotificationCenter.default.addObserver(self, selector: #selector(salvar), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    @objc func salvar(){
        Personagem.shared.salvar()
        Progresso.shared.save()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //Logica(A ser implementada) se ja tem um jogo salvo vai pro menu se nao tiver vai para customizacao(Abaixo)
        let viewController: UIViewController!
        let personagem = Personagem.shared
        
        if personagem.isSave() {
            let storyboard = UIStoryboard(name: "Principal", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: "Principal")
        } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewController = storyboard.instantiateViewController(withIdentifier: "Customizacao") as UIViewController
        }
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
}
