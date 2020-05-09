//
//  Progresso.swift
//  Mini02
//
//  Created by Rogerio Lucon on 08/05/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import Foundation

class Progresso {
    
    static let shared = Progresso()
    var progresso: Int
    var resposta7: Int
    
    private init(){
        if (UserDefaults.standard.object(forKey: "progresso.prog") != nil) {
            progresso = (UserDefaults.standard.object(forKey: "progresso.prog")) as! Int
        } else {
            progresso = 1
        }
        if (UserDefaults.standard.object(forKey: "progresso.resp7") != nil) {
            resposta7 = (UserDefaults.standard.object(forKey: "progresso.resp7")) as! Int
        } else {
            resposta7 = 0
        }
    }
    
    func save(){
        UserDefaults.standard.set(progresso, forKey: "progresso.prog")
    }
    
    func resetSave(){
        progresso = 1
        save()
    }
}
