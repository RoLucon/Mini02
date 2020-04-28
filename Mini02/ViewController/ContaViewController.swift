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
    @IBOutlet weak var aluguel: UIStackView!
    @IBOutlet weak var alimento: UIStackView!
    @IBOutlet weak var luz: UIStackView!
    @IBOutlet weak var mensalidade: UIStackView!
    @IBOutlet weak var material: UIStackView!
    
    @IBOutlet weak var kimAjuda: UIView!
    @IBOutlet weak var kimAjudaText: UILabel!
    var checkBoxBtts: [CheckBoxButton] = []
    
    var countText = 30
    
    //historia Fase2
    @IBOutlet weak var viewFase2: UIView!
    @IBOutlet weak var setaFase2: UIImageView!
    @IBOutlet weak var viewFrase: UIView!
    @IBOutlet weak var textoFase2: UILabel!
    @IBOutlet weak var kimFase2: UIImageView!
    @IBOutlet weak var gerenciarFase2: UIButton!
    @IBOutlet weak var viewInferior: UIView!
    @IBOutlet weak var stkViewInferior: UIStackView!
    @IBOutlet weak var gerenciarButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if contadorBanco >= 1 {
            viewFase2?.isHidden = false
            viewFrase?.isHidden = false
            setaFase2?.isHidden = false
           view.addSubview(gerenciarFase2)
            viewInferior?.transform = CGAffineTransform(translationX: 0, y: -40)
            stkViewInferior?.transform = CGAffineTransform(translationX: 0, y: -70)
            //Extrato?.transform = CGAffineTransform(translationX: 0, y: -130)
        }
        updateChart()
        startMission()
    }
    
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
    
    //História - Capítulo 2
    
    func startMission() {
        kimAjuda.isHidden = false
        kimAjudaText.text = texto[countText]
    }
    
    func fase3(){
        let stackViews: [UIStackView] = [aluguel, alimento, luz, mensalidade, material]
        
        for stack in stackViews {
            let btt = CheckBoxButton(tag: stack.tag)
            checkBoxBtts.append(btt)
            stack.insertArrangedSubview(btt, at: 0)
            stack.distribution = .equalSpacing
            stack.spacing = stack.spacing / 2 - 15
        }
        
    }
    
    @IBAction func changeMessage(_ sender: Any) {
        countText += 1
        kimAjudaText.text = texto[countText]
        
        if countText == 33 {
            fase3()
        }
    }
}
