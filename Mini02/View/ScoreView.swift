//
//  ScoreView.swift
//  Mini02
//
//  Created by Rogerio Lucon on 05/05/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class ScoreView: UIView {
    
    private var score: Int!
    var scoreBackground: UIColor = .lightGray
    var lineWidth = 5
    let texto: UILabel = UILabel()
    
    init(frame: CGRect, score: Int) {
        super.init(frame: frame)
        self.score = score
        self.setupView()
        self.criaObserver()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.score = Personagem.shared.score()
        self.setupView()
        self.criaObserver()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func criaObserver(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.update), name: NSNotification.Name(rawValue: "AtualizarScore"), object: nil)
    }
    
    func setupView(){
        backgroundColor = .clear
        update()
        texto.backgroundColor = .clear
        addSubview(texto)
        texto.translatesAutoresizingMaskIntoConstraints = false
        texto.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        texto.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        texto.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        texto.heightAnchor.constraint(equalToConstant: frame.width / 4).isActive = true
        texto.text = String(score)
        texto.textAlignment = .center
        texto.font = UIFont.systemFont(ofSize: frame.width / 4)
    }
    
    @objc func update(){
        self.score = Personagem.shared.score()
        self.layer.sublayers = nil
        
        shapeLayer(soma: 0, valor: 0.5, lineWidth: CGFloat(lineWidth) * 2, color: scoreBackground)
        let cor: [UIColor] = [.red, .yellow, .green]
        let auxDiv = 1000 / 3
        var auxScore = score as Int
        let numero = score / auxDiv
        var soma: Double = 0
        var valor: Double = 0
        if numero > 0 {
            for i in 0...numero - 1 {
                valor += 0.333/2
                auxScore -= auxDiv
                shapeLayer(soma: soma, valor: valor, lineWidth: CGFloat(lineWidth), color: cor[i])
                soma = valor
            }
        }
        if auxScore > 1{
            valor += ((Double(auxScore) * 0.333) / 333) / 2
            print(valor)
            shapeLayer(soma: soma, valor: valor, lineWidth: 5, color: cor[numero])
        }
        addSubview(texto)
        texto.text = String(Personagem.shared.score()!)
        print("UPDATE")
    }
    
    func shapeLayer(soma: Double, valor: Double, lineWidth: CGFloat, color: UIColor){
        let semiCircleLayer = CAShapeLayer()
        
        let center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height - 10)
        let circleRadius = self.frame.size.width / 2 - 10
        let pi = Double.pi
        let circlePath = UIBezierPath(arcCenter: center, radius: circleRadius, startAngle: CGFloat(pi), endAngle: CGFloat(pi * 3), clockwise: true)
        semiCircleLayer.path = circlePath.cgPath
        semiCircleLayer.strokeColor = color.cgColor
        semiCircleLayer.fillColor = UIColor.clear.cgColor
        semiCircleLayer.lineWidth = lineWidth
        semiCircleLayer.strokeStart = CGFloat(soma)
        semiCircleLayer.strokeEnd = CGFloat(valor)
        self.layer.addSublayer(semiCircleLayer)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let vc = parentViewController as? ViewController {
            vc.scoreInfo(self)
        }
        
    }
}
