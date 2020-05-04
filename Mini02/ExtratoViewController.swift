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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Label1?.text = "Salário"
        Valor1?.text = "R$ 1000,00"
        
        stack3?.isHidden = true
        stack7?.isHidden = false
        stack8?.isHidden = false
        stack9?.isHidden = false
        stack10?.isHidden = false

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
