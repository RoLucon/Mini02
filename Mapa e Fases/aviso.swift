//
//  aviso.swift
//  auto
//
//  Created by Rafael Costa on 03/04/20.
//  Copyright © 2020 Rafael Costa. All rights reserved.
//

import UIKit

class popup: UIViewController{
    
    
    @IBOutlet var pop: UIView!
    @IBOutlet weak var efeito: UIVisualEffectView!
    var effect:UIVisualEffect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        effect = efeito.effect
        efeito.effect = nil
        
        pop.layer.cornerRadius = 5
    }
    
    func anima(){
        self.view.addSubview(pop)
        pop.center = self.view.center
        pop.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        pop.alpha = 0
        
        UIView.animate(withDuration: 0.4){
            self.efeito.effect = self.effect
            self.pop.alpha = 1
            self.pop.transform = CGAffineTransform.identity
        }
    }
    
    func animaf(){
        UIView.animate(withDuration: 0.3, animations: {
            self.pop.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.pop.alpha = 0
            
            self.efeito.effect = nil
            
        }){ (success: Bool) in
            self.pop.removeFromSuperview()
        }
    }
    
    @IBAction func p1(_ sender: AnyObject) {
        anima()
    }
    
    @IBAction func p2(_ sender: Any) {
        anima()
    }
    
    
    @IBAction func p3(_ sender: Any) {
        anima()
    }
    
    @IBAction func fecha(_ sender: AnyObject) {
        animaf()
    }
    
}
