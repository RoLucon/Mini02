//
//  NarrativaViewController.swift
//  Mini02
//
//  Created by Rogerio Lucon on 07/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class NarrativaViewController : UIViewController {
    
    @IBOutlet weak var label: TextLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = ""
        carregaTexto()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        label.typeWriter()
    }
    
    func carregaTexto(){
        label.texto = "Kleytinho era um cara muito bacana e gostava de fazer balburdia na faculdade, as festas em sua republica eram supimpas"
    }
}
