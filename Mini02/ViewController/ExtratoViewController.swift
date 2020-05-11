//
//  ExtratoViewController.swift
//  Mini02
//
//  Created by Gabriel Rodrigues da Silva on 02/05/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class ExtratoViewController: UIViewController {
    
    @IBOutlet weak var stack1: UIStackView!
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Sinal1: UILabel!
    @IBOutlet weak var Valor1: UILabel!
    
    @IBOutlet weak var stack2: UIStackView!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Sinal2: UILabel!
    @IBOutlet weak var Valor2: UILabel!
    
    @IBOutlet weak var stack3: UIStackView!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Sinal3: UILabel!
    @IBOutlet weak var Valor3: UILabel!
    
    @IBOutlet weak var stack4: UIStackView!
    @IBOutlet weak var Label4: UILabel!
    @IBOutlet weak var Sinal4: UILabel!
    @IBOutlet weak var Valor4: UILabel!
    
    @IBOutlet weak var stack5: UIStackView!
    @IBOutlet weak var Label5: UILabel!
    @IBOutlet weak var Sinal5: UILabel!
    @IBOutlet weak var Valor5: UILabel!
    
    @IBOutlet weak var stack6: UIStackView!
    @IBOutlet weak var Label6: UILabel!
    @IBOutlet weak var Sinal6: UILabel!
    @IBOutlet weak var Valor6: UILabel!
    
    @IBOutlet weak var stack7: UIStackView!
    @IBOutlet weak var Label7: UILabel!
    @IBOutlet weak var Sinal7: UILabel!
    @IBOutlet weak var Valor7: UILabel!
    
    @IBOutlet weak var stack8: UIStackView!
    @IBOutlet weak var Label8: UILabel!
    @IBOutlet weak var Sinal8: UILabel!
    @IBOutlet weak var Valor8: UILabel!
    
    @IBOutlet weak var stack9: UIStackView!
    @IBOutlet weak var Label9: UILabel!
    @IBOutlet weak var Sinal9: UILabel!
    @IBOutlet weak var Valor9: UILabel!
    
    @IBOutlet weak var stack10: UIStackView!
    @IBOutlet weak var Label10: UILabel!
    @IBOutlet weak var Sinal10: UILabel!
    @IBOutlet weak var Valor10: UILabel!
    
    @IBOutlet weak var mesAtual: UILabel!
    @IBOutlet weak var mesAnterior: UILabel!
    
    let mes = ["Dezembro 2019", "Janeiro 2020", "Fevereiro 2020", "Março 2020", "Abril 2020","Maio 2020", "Junho 2020", "Julho 2020", "Agosto 2020", "Setembro 2020", "Outubro 2020", "Novembro 2020", "Dezembro 2020"]
    
    let nome = ["Salário", "App Store", "App Store","App Store", "App Store", "App Store", "App Store", "App Store", "App Store", "Salário"]
    
    let valor = ["R$ 1000,00", "R$ 300,00", "R$ 50,00","R$ 10,00", "R$ 1,00", "R$ 65,00", "R$ 20,00", "R$ 100,00", "R$ 200,00", "R$ 1000,00"]

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if prog == 1 && contadorBanco == 0 {
            stack1?.isHidden = true
        }
        else if prog > 2 {
            atual()
            anterior()
        }


    }
    
    func atual() {
        
        mesAtual?.text = mes[prog+1]
        
        Label1?.text = nome[0]
        Sinal1?.text = "+ "
        Sinal1?.textColor = .systemGreen
        Valor1?.text = valor[0]
        
        Label2?.text = nome[1]
        Sinal2?.text = "- "
        Sinal2?.textColor = .systemRed
        Valor2?.text = valor[1]
        
        Label3?.text = nome[2]
        Sinal3?.text = "- "
        Sinal3?.textColor = .systemRed
        Valor3?.text = valor[2]
        
        Label4?.text = nome[3]
        Sinal4?.text = "- "
        Sinal4?.textColor = .systemRed
        Valor4?.text = valor[3]
        
        Label5?.text = nome[4]
        Sinal5?.text = "- "
        Sinal5?.textColor = .systemRed
        Valor5?.text = valor[4]
        
    }
    
    func anterior() {
        
        mesAnterior?.text = mes[prog]
 
        Label6?.text = nome[5]
        Sinal6?.text = "- "
        Sinal6?.textColor = .systemRed
        Valor6?.text = valor[5]
        
        Label7?.text = nome[6]
        Sinal7?.text = "- "
        Sinal7?.textColor = .systemRed
        Valor7?.text = valor[6]
        
        Label8?.text = nome[7]
        Sinal8?.text = "- "
        Sinal8?.textColor = .systemRed
        Valor8?.text = valor[7]
        
        Label9?.text = nome[8]
        Sinal9?.text = "- "
        Sinal9?.textColor = .systemRed
        Valor9?.text = valor[8]
        
        Label10?.text = nome[9]
        Sinal10?.text = "+ "
        Sinal10?.textColor = .systemGreen
        Valor10?.text = valor[9]
        
    }

    @IBAction func fechar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
