//
//  ConfigView.swift
//  Mini02
//
//  Created by Rogerio Lucon on 09/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class ConfigView: UIView {
    
    let vc: UIViewController?
    
    let bg: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 14
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let quitBtt: UIButton = {
        let size = 44
        let btt = UIButton()
        btt.backgroundColor = .black
        btt.layer.borderWidth = 3
        btt.layer.borderColor = UIColor.white.cgColor
        btt.layer.cornerRadius = CGFloat(size / 2)
        btt.translatesAutoresizingMaskIntoConstraints = false
        btt.heightAnchor.constraint(equalToConstant: CGFloat(size)).isActive = true
        btt.widthAnchor.constraint(equalToConstant: CGFloat(size)).isActive = true
        btt.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        return btt
    }()
    
    let versionLabel: UILabel = {
        let label = UILabel()
        label.text = "v0.0"
        label.textColor = .white
        label.backgroundColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(frame: CGRect, viewController: UIViewController) {
        vc = viewController
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        let resetBtt = buttons(name: "Nova Campanha")
        resetBtt.addTarget(self, action: #selector(reset), for: .touchUpInside)
        let suporteBtt = buttons(name: "Suporte Button")
        
        let audioView = subConfig(name: "AUDIO", switcheNames: ["Campanha", "Sidequest"])
        let pushView = subConfig(name: "PUSH", switcheNames: ["Campanha", "Sidequest"])
        
        let stackView = UIStackView(arrangedSubviews: [UIView(),audioView,pushView, UIView()])
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 16
        
        bg.addSubview(stackView)
        bg.addSubview(quitBtt)
        bg.addSubview(suporteBtt)
        bg.addSubview(resetBtt)
        bg.addSubview(versionLabel)
        
//        audioConfig()
//        pushConfig()
        efeitoBlur()
        
        mostrarTabBar(value: false)
        
        quitBtt.topAnchor.constraint(equalTo: bg.topAnchor, constant: 16).isActive = true
        quitBtt.trailingAnchor.constraint(equalTo: bg.trailingAnchor, constant: -16).isActive = true
        
        versionLabel.heightAnchor.constraint(equalToConstant: 31).isActive = true
        versionLabel.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -8).isActive = true
        versionLabel.leadingAnchor.constraint(equalTo: bg.leadingAnchor, constant: 16).isActive = true
        versionLabel.trailingAnchor.constraint(equalTo: bg.trailingAnchor, constant: -16).isActive = true
        
        resetBtt.heightAnchor.constraint(equalToConstant: 64).isActive = true
        resetBtt.bottomAnchor.constraint(equalTo: versionLabel.topAnchor, constant: -32).isActive = true
        resetBtt.leadingAnchor.constraint(equalTo: bg.leadingAnchor, constant: 16).isActive = true
        resetBtt.trailingAnchor.constraint(equalTo: bg.trailingAnchor, constant: -16).isActive = true

        suporteBtt.heightAnchor.constraint(equalToConstant: 64).isActive = true
        suporteBtt.bottomAnchor.constraint(equalTo: resetBtt.topAnchor, constant: -16).isActive = true
        suporteBtt.leadingAnchor.constraint(equalTo: bg.leadingAnchor, constant: 16).isActive = true
        suporteBtt.trailingAnchor.constraint(equalTo: bg.trailingAnchor, constant: -16).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: bg.topAnchor, constant: 32).isActive = true
        stackView.bottomAnchor.constraint(equalTo: suporteBtt.topAnchor, constant: -16).isActive = true
        stackView.leadingAnchor.constraint(equalTo: bg.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: bg.trailingAnchor, constant: -16).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func suport(){
        
    }
    
    @objc func reset(){
        let alert = UIAlertController(title: "Nova Campanha",
                      message: "Todo o progresso atual sera perdido e uma nova campanha sera iniciada. Deseja continuar?",
                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: {(UIAlertAction) in
            
        }))
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: {(UIAlertAction) in
            let personagem = Personagem.shared
            personagem.resetSave()
            let investimento = Investimento()
            investimento.resetSave()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier: "Inicio")
            viewController.modalPresentationStyle = .fullScreen
            self.vc?.present(viewController, animated: true, completion: {
                self.dismiss()
            })
        }))
        vc?.present(alert, animated: true, completion: nil)
        
    }
    
    @objc func dismiss(){
        mostrarTabBar(value: true)
        animacaoDeSaida()
    }
    
    private func switchesBtt(name: String) -> UIStackView {
        let btt = UISwitch(frame: .init(x: 0, y: 0, width: 51, height: 31))
        btt.backgroundColor = .gray
        btt.layer.cornerRadius = btt.frame.size.height / 2
        
        let label = UILabel()
        label.text = name
        label.textColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [label, UIView(), btt])
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    private func subConfig(name: String, switcheNames: [String]) -> UIView {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        bg.addSubview(view)
        //Label - Text
        let label = UILabel()
        label.backgroundColor = view.backgroundColor
        label.text = name
        label.textColor = .white
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        label.heightAnchor.constraint(equalToConstant: 32).isActive = true
        //Switches
        var switchs: [UIStackView] = []
        for btt in switcheNames {
            let aux = switchesBtt(name: btt)
            switchs.append(aux)
        }
        
        let stackView = UIStackView(arrangedSubviews: switchs)
        stackView.axis = . vertical
        stackView.distribution = .equalCentering
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        stackView.topAnchor.constraint(equalTo: label.topAnchor, constant: 39).isActive = true
        
        let elementsSize = 62 * switchs.count
        let totalSpacing = 16 * (switchs.count - 1)
        let size: CGFloat = CGFloat (elementsSize + totalSpacing)
        view.heightAnchor.constraint(equalToConstant: size).isActive = true
        
        return view
    }
    
    private func buttons(name: String) -> UIButton {
        let btt = UIButton()
        btt.setTitle(name, for: .normal)
        btt.tintColor = .white
        btt.layer.borderWidth = 3
        btt.layer.borderColor = UIColor.white.cgColor
        btt.layer.cornerRadius = 32
        btt.translatesAutoresizingMaskIntoConstraints = false
        btt.backgroundColor = .black
        return btt
    }
    
    private func efeitoBlur(){
        let blurImgView = UIImageView()
        
        blurImgView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurImgView.frame = bounds
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.alpha = 1
        blurView.frame = blurImgView.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        blurImgView.addSubview(blurView)
        
        addSubview(blurView)
        
        addSubview(bg)
        
        bg.topAnchor.constraint(equalTo: topAnchor, constant: 90).isActive = true
        bg.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
        bg.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        bg.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90).isActive = true
    }
    
    func mostrarTabBar(value: Bool) {
        if let bar = vc?.tabBarController {
            bar.setTabBar(hidden: !value, animated: true, viewController: vc!)
        }
    }
    
    private func animacaoDeSaida(){
        UIView.animate(withDuration: 0.25, animations: {
            self.frame = self.frame.offsetBy(dx: 0, dy: -UIScreen.main.bounds.height)
        }, completion: {(finished: Bool) in
            self.removeFromSuperview()
        })
    }
}

