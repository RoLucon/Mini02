//
//  CheckBoxButton.swift
//  Mini02
//
//  Created by Rogerio Lucon on 28/04/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import UIKit

class CheckBoxButton: UIButton {
    
    var selecionado = false
    
    init(frame: CGRect = CGRect(x: 0, y: 0, width: 30, height: 30), tag: Int) {
        super.init(frame: frame)
        self.tag = tag
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 30).isActive = true
        widthAnchor.constraint(equalToConstant: 30).isActive = true
        layer.cornerRadius = frame.size.height < frame.size.width ?
            frame.size.height / 3 : frame.size.width / 3
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        selecionado = !selecionado
        if selecionado {
            backgroundColor = .green
        } else {
            backgroundColor = .clear
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

