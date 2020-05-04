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
    var checkBoxBtts: [CheckBoxButton] = []
    @IBOutlet weak var pieChartView: UIView!
    
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
    
    var controleTexto = ["index": 0, "primeiro": 0, "ultimo": 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateChart()
        prog = 3
        contadorBanco = 2
        //Fase 1
        if prog == 1 && contadorBanco >= 1 {
            viewFrase?.isHidden = false
            textoFase2?.text = textoFase1[contadorBanco]
            gerenciarButton.isUserInteractionEnabled = false
            viewInferior?.transform = CGAffineTransform(translationX: 0, y: -60)
            stkViewInferior?.transform = CGAffineTransform(translationX: 0, y: -80)
        } else if prog == 2 && contadorBanco >= 1 {
            viewFrase?.isHidden = false
            viewFase2?.isHidden = false
            setaFase2?.isHidden = false
            textoFase2?.text = textoFase1[9]
            gerenciarFase2.isHidden = false
            //view.addSubview(gerenciarFase2)
            viewInferior?.transform = CGAffineTransform(translationX: 0, y: -40)
            stkViewInferior?.transform = CGAffineTransform(translationX: 0, y: -70)
            //Extrato?.transform = CGAffineTransform(translationX: 0, y: -130)
        } else if prog == 3 && contadorBanco >= 1 { // Fase 3
            viewFrase?.isHidden = false
            viewFase2?.isHidden = false
            fase3()
            self.navigationItem.setHidesBackButton(true, animated: true)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(proximoTexto(_:)), name: NSNotification.Name.init("AtualizarView"), object: nil)
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
    
     
    //História capítulo 1
    @IBAction func proximoTexto(_ sender: Any) {
         
    }
    
    func fase1BttProximo(){
        if contadorBanco >= 9 && contadorBanco < 11 {
         contadorBanco += 1
         textoFase2?.text = textoFase1[contadorBanco]
        
        if contadorBanco == 11 {
            viewFase2?.isHidden = false
            setaFase2?.isHidden = false
            gerenciarFase2?.isHidden = false
            NotificationCenter.default.post(name: NSNotification.Name.init("AtualizarFala"), object: nil)
            }
        } else if contadorBanco == 14 {
            //gerenciarButton.isUserInteractionEnabled = true
            viewFase2?.isHidden = true
            viewFrase?.isHidden = true
            gerenciarFase2?.isHidden = true
            viewInferior?.transform = .identity
            stkViewInferior?.transform = .identity
        }
    }
    
    //Fase 3
    func fase3(){
        let stackViews = stkViewInferior.arrangedSubviews
        stkViewInferior.distribution = .fillEqually
        
        for stack in stackViews {
            let btt = CheckBoxButton(tag: stack.tag)
            checkBoxBtts.append(btt)
            let aux: UIStackView = stack as! UIStackView
            aux.insertArrangedSubview(btt, at: 0)
            aux.distribution = .equalSpacing
            aux.spacing = aux.spacing / 2 - 15
        }
        fase3AjustaTela()
    }
    
    func fase3AjustaTela(){
        textoFase2?.text = textoFase3[1]
        viewInferior?.transform = CGAffineTransform(translationX: 0, y: -65)
        stkViewInferior?.transform = CGAffineTransform(translationX: 0, y: -90)
        gerenciarFase2.isHidden = true
        let gl = CAGradientLayer()
        gl.colors = [viewFase2.backgroundColor!.cgColor,viewFase2.backgroundColor!.cgColor, UIColor.clear.cgColor, UIColor.clear.cgColor]
        gl.locations = [0.4, 0.55, 0.6, 1.0]
        gl.frame = viewFase2.frame
        viewFase2.layer.addSublayer(gl)
        viewFase2.backgroundColor = .clear
        stkViewInferior.superview?.bringSubviewToFront(stkViewInferior)
        controleTexto["index"] = 1
        controleTexto["primeiro"] = 1
        controleTexto["ultimo"] = 8
    }
    
    func destacaRespostaCorreta(){
        for stack in stkViewInferior.arrangedSubviews {
            if stack.tag == 1 || stack.tag == 3 {
                let label = UILabel(frame: stack.frame)
                label.backgroundColor = .clear
                label.layer.borderWidth = 3
                label.layer.borderColor = UIColor.green.cgColor
                label.layer.cornerRadius = 10
                stack.addSubview(label)
                label.translatesAutoresizingMaskIntoConstraints = false
                label.bottomAnchor.constraint(equalTo: stack.bottomAnchor, constant: 10).isActive = true
                label.topAnchor.constraint(equalTo: stack.topAnchor, constant: -10).isActive = true
                label.leadingAnchor.constraint(equalTo: stack.leadingAnchor, constant: -10).isActive = true
                label.trailingAnchor.constraint(equalTo: stack.trailingAnchor, constant: 10).isActive = true
            }
        }
    }
    
    func calculaRespostsa() -> String {
        var certas = 0
        var erradas = 0
        for btt in checkBoxBtts {
            if btt.tag == 1 {
                if btt.selecionado {
                    certas += 1
                } else {
                    erradas += 1
                }
            } else if btt.tag == 0 {
                if !btt.selecionado{
                    certas += 1
                } else{
                    erradas += 1
                }
            }
        }
        if erradas == 0 {
            return feedBackFase4[1]!
        } else if ((certas+erradas)/2) > erradas {
            return feedBackFase4[2]!
        } else {
            return feedBackFase4[3]!
        }
    }
    
    //Botoes de texto Kim
    @IBAction func next(_ sender: Any) {
        if prog == 1 {
            fase1BttProximo()
        } else if prog != 1 {
            if controleTexto["index"]! < controleTexto["ultimo"]! {
                controleTexto["index"]! += 1
            }
            if controleTexto["index"]! == 2 {
                textoFase2.text = calculaRespostsa()
                controleTexto["primeiro"] = 3
            } else if controleTexto["index"]! == 3{
                 destacaRespostaCorreta()
                 textoFase2.text = textoFase3[controleTexto["index"]!]
            } else {
                textoFase2.text = textoFase3[controleTexto["index"]!]
            }
            if controleTexto["index"]! == 8 {
                self.navigationItem.setHidesBackButton(false, animated: true)
            }
        }
    }
    
    @IBAction func back(_ sender: Any) {
        if prog != 1 {
            if controleTexto["index"]! > controleTexto["primeiro"]! {
                controleTexto["index"]! -= 1
                print(controleTexto["index"]!)
                textoFase2.text = textoFase3[controleTexto["index"]!]
            }
        }
    }
    
    

}

