//
//  ContaViewController.swift
//  Mini02
//
//  Created by Rogerio Lucon on 17/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class ContaViewController: UIViewController {
    let numeros: [Double] = [90,90,90,90,90,90]
    
    @IBOutlet weak var pieChartView: UIView!
    
    
    //História
    @IBOutlet weak var texto: UILabel!
    @IBOutlet weak var textoView: UIView!
    @IBOutlet weak var seta: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateChart()
        
        if contadorBanco >= 1 {
            textoView?.isHidden = false
            texto?.text = texto2[9]
        }
    }
    
    
    //História capítulo 1
    @IBAction func proximoTexto(_ sender: Any) {
        if contadorBanco >= 9 && contadorBanco < 11 {
            contadorBanco += 1
            texto?.text = texto2[contadorBanco]
        }
 

    }
    
    
    
    
    
    //Gráfico
    
    func updateChart(numeros: [Double]){
        updateChart()
    }
    
    func updateChart(){
        pieChartView.layer.sublayers = nil
        pieChartView.backgroundColor = .clear
        let cor: [UIColor] = [.blue, .cyan, .green, .yellow, .red, .purple]
        var total: Double = 0
        for i in numeros {
            total += i
        }
        var soma: Double = 0
        var index: Int = 0
        shapeLayer(soma: 0, valor: 1, lineWidth: 22, color: UIColor.init(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.3))
        for i in numeros {
            var valor: Double = i / total
            valor += soma
            shapeLayer(soma: soma, valor: valor, lineWidth: 10, color: cor[index])
            soma = valor
            index += 1
        }
    }
    
    func shapeLayer(soma: Double, valor: Double, lineWidth: CGFloat, color: UIColor){
        let semiCircleLayer = CAShapeLayer()
        
        let center = CGPoint(x: pieChartView.frame.size.width / 2, y: pieChartView.frame.size.height / 2)
        let circleRadius = pieChartView.frame.size.width / 2
        let pi = Double.pi
        let circlePath = UIBezierPath(arcCenter: center, radius: circleRadius, startAngle: CGFloat(pi), endAngle: CGFloat(pi * 3), clockwise: true)
        semiCircleLayer.path = circlePath.cgPath
        semiCircleLayer.strokeColor = color.cgColor
        semiCircleLayer.fillColor = UIColor.clear.cgColor
        semiCircleLayer.lineWidth = lineWidth
        semiCircleLayer.strokeStart = CGFloat(soma)
        semiCircleLayer.strokeEnd = CGFloat(valor)
        pieChartView.layer.addSublayer(semiCircleLayer)
    }
}

