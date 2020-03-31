//
//  IntroducaoViewController.swift
//  Mini02
//
//  Created by Rogerio Lucon on 30/03/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class IntroducaoViewController: UIViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //Logica(A ser implementada) se ja tem um jogo salvo vai pro menu se nao tiver vai para customizacao(Abaixo)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if save {
//            let viewController: UIViewController = storyboard.instantiateViewController(withIdentifier: "Teste")
//        } else {
            let viewController: UIViewController = storyboard.instantiateViewController(withIdentifier: "Customizacao") as UIViewController
//        }
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
}
