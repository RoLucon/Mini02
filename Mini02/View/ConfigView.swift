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
    
    let header: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let body: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let suporteBtt: UIButton = {
        let btt = UIButton()
        btt.translatesAutoresizingMaskIntoConstraints = false
        btt.backgroundColor = .red
        return btt
    }()
    
    let resetBtt: UIButton = {
        let btt = UIButton(frame: .init(x: 200, y: 200, width: 50, height: 50))
        btt.translatesAutoresizingMaskIntoConstraints = false
        btt.backgroundColor = .orange
        btt.addTarget(self, action: #selector(dismiss), for: .touchUpInside)
        return btt
    }()
    
    
    init(frame: CGRect, viewController: UIViewController) {
        vc = viewController
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        bg.addSubview(resetBtt)
        efeitoBlur()
        mostrarTabBar(value: false)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func suport(){
        
    }
    
    @objc func reset(){
        
    }
    
    @objc func dismiss(){
        mostrarTabBar(value: true)
        animacaoDeSaida()
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
    
    private func mostrarTabBar(value: Bool) {
        
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

